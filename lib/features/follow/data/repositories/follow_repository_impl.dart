import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';
import '../../domain/repositories/follow_repository.dart';
import '../data_sources/follow_remote_data_source.dart';

class FollowRepositoryImpl implements FollowRepository {
  FollowRepositoryImpl(this._remoteDataSource);
  final FollowRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, void>> followUser(
      {required FollowParams params}) async {
    try {
      final remoteFollowUser =
          await _remoteDataSource.followUser(params: params);
      return Right(remoteFollowUser);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> getUserFollowed(
      {required FollowUserParams params}) async {
    try {
      final remotoFolloweds =
          await _remoteDataSource.getUserFollowed(params: params);
      return Right(remotoFolloweds);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> getUserFollowers(
      {required FollowUserParams params}) async {
    try {
      final remoteFollowers =
          await _remoteDataSource.getUserFollowers(params: params);
      return Right(remoteFollowers);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isFollowedUser(
      {required FollowParams params}) async {
    try {
      final remoteIsFollowed =
          await _remoteDataSource.isFollowedUser(params: params);
      return Right(remoteIsFollowed);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> unFollowUser(
      {required FollowParams params}) async {
    try {
      final remoteUnFollowUser =
          await _remoteDataSource.unfollowUser(params: params);
      return Right(remoteUnFollowUser);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }
}
