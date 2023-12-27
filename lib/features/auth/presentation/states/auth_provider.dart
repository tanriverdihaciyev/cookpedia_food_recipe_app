import '../../../../core/params/email_params.dart';
import '../../domain/usecases/send_pass_reset_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/params/void_params.dart';
import '../../../follow/presentation/states/follow_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/data/models/user_model.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_email_password.dart';
import '../../domain/usecases/sign_in_or_up_gmail.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/sign_up_email_password.dart';

class AuthProvider extends ChangeNotifier {
  AuthEntity? auth;
  Failure? failure;
  Failure? resetPassfailure;

  Stream<User?> changedAuth() {
    return FirebaseAuth.instance.userChanges();
  }

  Future<void> eitherSignInEmailAuthOrFailure({
    required String email,
    required String password,
    required UserProvider userProvider,
    required UserDetailProvider userDetailProvider,
    required RecipeProvider recipeProvider,
  }) async {
    AuthRepository repository = AuthRepositoryImpl(
      FirebaseAuthService(),
    );

    final signInEmailPassword = await SignInEmailPassword(repository)
        .call(AuthParams(email: email, password: password));

    signInEmailPassword.fold(
      (Failure newFailure) {
        failure = newFailure;
        auth = null;
        notifyListeners();
      },
      (AuthEntity newAuth) async {
        auth = newAuth;
        failure = null;
        await userProvider.eitherGetUserOrFailure(
          params: UserParams(id: newAuth.id),
          userDetailProvider: userDetailProvider,
          recipeProvider: recipeProvider,
        );

        notifyListeners();
      },
    );
  }

  Future<void> eitherSignUpEmailAuthOrFailure(
      {required AuthParams params}) async {
    AuthRepository repository = AuthRepositoryImpl(
      FirebaseAuthService(),
    );
    final signUpEmailPassword = await SignUpEmailPassword(repository).call(
      params,
    );

    signUpEmailPassword.fold(
      (Failure newFailure) {
        failure = newFailure;
        auth = null;
        notifyListeners();
      },
      (AuthEntity newAuth) {
        auth = newAuth;

        failure = null;

        notifyListeners();
      },
    );
  }

  Future<void> eitherSignInOrUpGmailAuthOrFailure({
    required UserProvider userProvider,
    required UserDetailProvider userDetailProvider,
    required RecipeProvider recipeProvider,
  }) async {
    AuthRepository repository = AuthRepositoryImpl(
      FirebaseAuthService(),
    );
    final signInEmailPassword =
        await SignInOrUpGmail(repository).call(VoidParams());

    signInEmailPassword.fold(
      (Failure newFailure) {
        failure = newFailure;
        auth = null;
        notifyListeners();
      },
      (AuthEntity newAuth) async {
        auth = newAuth;
        failure = null;
        await userProvider.eitherGetUserOrFailure(
            params: UserParams(id: newAuth.id),
            userDetailProvider: userDetailProvider,
            recipeProvider: recipeProvider);
        if (userProvider.failure != null) {
          await userProvider.eitherCreateUserOrFailure(
            params: UserModel.fromAuth(auth!),
          );
        }

        notifyListeners();
      },
    );
  }

  Future<void> eitherSignOutVoidOrFailure({
    required UserProvider userProvider,
    required RecipeProvider recipeProvider,
    required FollowProvider followProvider,
  }) async {
    AuthRepository repository = AuthRepositoryImpl(
      FirebaseAuthService(),
    );
    final signInEmailPassword = await SignOut(repository).call(VoidParams());

    signInEmailPassword.fold(
      (Failure newFailure) {
        failure = newFailure;
        auth = null;
        notifyListeners();
      },
      (void notAuth) {
        auth = null;
        failure = null;
        userProvider.user = null;
        userProvider.failure = null;
        recipeProvider.recipes = null;
        recipeProvider.recipesFailure = null;
        followProvider.resetAll();
        notifyListeners();
      },
    );
  }

  Future<void> eitherSendPassResetEmail({required EmailParams params}) async {
    AuthRepository repository = AuthRepositoryImpl(
      FirebaseAuthService(),
    );
    final signInEmailPassword =
        await SendPassResetEmail(repository).call(params);

    signInEmailPassword.fold(
      (Failure newFailure) {
        resetPassfailure = newFailure;
        notifyListeners();
      },
      (void notAuth) {
        resetPassfailure = null;

        notifyListeners();
      },
    );
  }
}
