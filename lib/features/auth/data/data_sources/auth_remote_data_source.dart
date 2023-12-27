import 'package:cookpedia_foodrecipe_app/core/params/email_params.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/auth_params.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signUpEmailAndPassword({required AuthParams params});
  Future<AuthModel> signInEmailAndPassword({required AuthParams params});
  Future<AuthModel> signInGmail();
  Future<void> signOut();
  Future<void> sendPassResetEmail({required EmailParams params});
}

class FirebaseAuthService implements AuthRemoteDataSource {
  final _authService = FirebaseAuth.instance;

  // @override
  // Stream<AuthModel?> authChanges() async* {
  //   AuthModel? auth;

  //   _authService.userChanges();
  //   yield auth;
  // }

  @override
  Future<AuthModel> signInEmailAndPassword({required AuthParams params}) async {
    UserCredential credential = await _authService
        .signInWithEmailAndPassword(
            email: params.email, password: params.password)
        .onError(
          (error, stackTrace) => throw AuthServerException(),
        );
    if (credential.user != null) {
      return AuthModel.fromUser(credential.user!);
    } else {
      throw AuthServerException();
    }
  }

  @override
  Future<AuthModel> signInGmail() async {
    GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignIn?.authentication;
    OAuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);
    UserCredential userCredential =
        await _authService.signInWithCredential(authCredential);
    if (userCredential.user != null) {
      return AuthModel.fromUser(userCredential.user!);
    } else {
      throw AuthServerException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      _authService
          .signOut()
          .then((value) => null)
          .onError((FirebaseAuthException error, stackTrace) {
        throw AuthServerException();
      });
    } catch (e) {
      throw AuthServerException();
    }
  }

  @override
  Future<AuthModel> signUpEmailAndPassword({required AuthParams params}) async {
    UserCredential credential =
        await _authService.createUserWithEmailAndPassword(
            email: params.email, password: params.password);
    if (credential.user != null) {
      return AuthModel.fromUser(credential.user!);
    } else {
      throw AuthServerException();
    }
  }

  @override
  Future<void> sendPassResetEmail({required EmailParams params}) async {
    try {
      await _authService
          .sendPasswordResetEmail(email: params.email)
          .then((value) => null)
          .onError(
            (error, stackTrace) => throw AuthServerException(),
          );
    } catch (e) {
      throw AuthServerException();
    }
  }
}
