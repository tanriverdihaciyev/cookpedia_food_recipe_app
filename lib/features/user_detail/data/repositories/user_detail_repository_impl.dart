import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../domain/entities/user_detail_entity.dart';
import '../../domain/repositories/user_detail_repository.dart';
import '../data_sources/user_detail_remote_data_source.dart';
import '../models/user_detail_model.dart';

class UserDetailRepositoryImpl implements UserDetailRepository {
  UserDetailRepositoryImpl(this._remoteDataSource);

  final UserDetailRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, void>> createUserDetail(
      {required UserDetailEntity params}) async {
    try {
      await _remoteDataSource.createUserDetail(
          params: UserDetailModel.fromEntity(params));
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, UserDetailModel>> getUserDetail(
      {required UserDetailParams params}) async {
    try {
      UserDetailModel remoteUserDetail =
          await _remoteDataSource.getUserDetail(params: params);
      return Right(remoteUserDetail);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserDetail(
      {required UpdateUserDetailParams params}) async {
    try {
      await _remoteDataSource.updateUserDetail(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
