import 'package:cookpedia_foodrecipe_app/core/params/email_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/auth_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
  );
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, AuthModel>> signInEmailAndPassword(
      {required AuthParams params}) async {
    try {
      final remoteAuth =
          await _remoteDataSource.signInEmailAndPassword(params: params);
      return Right(remoteAuth);
    } on AuthServerException {
      return Left(AuthFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInGmail() async {
    try {
      final remoteAuth = await _remoteDataSource.signInGmail();

      return Right(remoteAuth);
    } on AuthServerException {
      return Left(AuthFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final remoteAuth = await _remoteDataSource.signOut();

      return Right(remoteAuth);
    } on AuthServerException {
      return Left(AuthFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUpEmailAndPassword(
      {required AuthParams params}) async {
    try {
      final remoteAuth =
          await _remoteDataSource.signUpEmailAndPassword(params: params);

      return Right(remoteAuth);
    } on AuthServerException {
      return Left(AuthFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> sendPassResetEmail(
      {required EmailParams params}) async {
    try {
      final remoteSendPass =
          await _remoteDataSource.sendPassResetEmail(params: params);
      return Right(remoteSendPass);
    } on AuthServerException {
      return Left(AuthFailure(message: "message", code: "code"));
    }
  }
}
