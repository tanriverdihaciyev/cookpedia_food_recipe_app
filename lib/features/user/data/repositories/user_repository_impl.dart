import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userRemoteDataSource);
  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<Either<Failure, void>> createUser({required UserEntity params}) async {
    try {
      await _userRemoteDataSource.createUser(
          params: UserModel.fromEntity(params));
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    try {
      var remoteUser = await _userRemoteDataSource.getUser(params: params);
      return Right(remoteUser);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(
      {required UpdateUserParams params}) async {
    try {
      var remoteUser = await _userRemoteDataSource.updateUser(params: params);
      return Right(remoteUser);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getTopUsers() async {
    try {
      var remoteUsers = await _userRemoteDataSource.getTopUser();
      return Right(remoteUsers);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }
}
