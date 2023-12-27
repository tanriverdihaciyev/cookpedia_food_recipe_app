import '../../../../core/params/void_params.dart';
import '../../domain/usecases/get_top_users.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../../../core/params/user_params.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import '../../data/data_sources/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/update_user.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? user;
  Failure? failure;
  Failure? updateFailure;
  UserEntity? otherUser;
  Failure? otherUserFailure;
  UserEntity? recipeUser;
  Failure? recipeUserFailure;
  List<UserEntity>? topUsers;
  Failure? topUsersFailure;

  bool isActiveUser(String id) => id == user!.id;

  void resetOther() {
    otherUser = null;
    otherUserFailure = null;
    notifyListeners();
  }

  Future<void> eitherCreateUserOrFailure({
    required UserEntity params,
  }) async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eitherVoidOrFailure = await CreateUser(repository).call(params);
    eitherVoidOrFailure.fold((Failure newFailure) {
      user = null;
      failure = newFailure;
      notifyListeners();
    }, (void result) async {
      user = null;
      failure = null;

      notifyListeners();
    });
  }

  Future<void> eitherGetTopUsersOrFailure() async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eitherVoidOrFailure =
        await GetTopUsers(repository).call(VoidParams());
    eitherVoidOrFailure.fold((Failure newFailure) {
      topUsers = null;
      topUsersFailure = newFailure;
      notifyListeners();
    }, (List<UserEntity> result) async {
      topUsers = result;
      topUsersFailure = null;

      notifyListeners();
    });
  }

  Future<void> eitherUpdateUserOrFailure({
    required UpdateUserParams params,
  }) async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eitherVoidOrFailure = await UpdateUser(repository).call(params);
    eitherVoidOrFailure.fold((Failure newFailure) {
      updateFailure = newFailure;
      notifyListeners();
    }, (void result) async {
      updateFailure = null;

      notifyListeners();
    });
  }

  Future<void> eitherGetUserOrFailure(
      {required UserParams params,
      required UserDetailProvider userDetailProvider,
      required RecipeProvider recipeProvider}) async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eitherVoidOrFailure = await GetUser(repository).call(params);
    eitherVoidOrFailure.fold((Failure newFailure) {
      user = null;
      failure = newFailure;
      notifyListeners();
    }, (UserEntity newUser) async {
      user = newUser;
      failure = null;
      await recipeProvider.eitherGetUserRecipesOrFailure(
        params: RecipeUserParams(
          sharedUserID: newUser.id,
        ),
      );
      await userDetailProvider.eitherGetUserDetailVoidOrFailure(
        params: UserDetailParams(id: newUser.id),
      );
      notifyListeners();
    });
  }

  Future<void> eitherGetOtherUserOrFailure({
    required UserParams params,
  }) async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eithergetOtherUser = await GetUser(repository).call(params);

    eithergetOtherUser.fold((l) {
      otherUser = null;
      otherUserFailure = l;
      notifyListeners();
    }, (r) {
      otherUser = r;
      otherUserFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetRecipeUserOrFailure({
    required UserParams params,
  }) async {
    UserRepository repository = UserRepositoryImpl(FirebaseUserService());
    final eitherVoidOrFailure = await GetUser(repository).call(params);
    eitherVoidOrFailure.fold((Failure newFailure) {
      recipeUser = null;
      recipeUserFailure = newFailure;
      notifyListeners();
    }, (UserEntity newUser) {
      recipeUser = newUser;
      recipeUserFailure = null;

      notifyListeners();
    });
  }
}
