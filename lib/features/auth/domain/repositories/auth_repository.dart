import 'package:cookpedia_foodrecipe_app/core/params/email_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> signUpEmailAndPassword(
      {required AuthParams params});
  Future<Either<Failure, AuthEntity>> signInEmailAndPassword(
      {required AuthParams params});
  Future<Either<Failure, AuthEntity>> signInGmail();

  Future<Either<Failure, void>> signOut();

  // Stream<Either<Failure, AuthEntity?>> authChanges();
  Future<Either<Failure, void>> sendPassResetEmail(
      {required EmailParams params});

  // Future<Either<Failure, String>> verifyPasswordResetCode(String code);

  // Future<Either<Failure, void>> confirmPasswordReset(
  //     String code, String newPassword);
}
