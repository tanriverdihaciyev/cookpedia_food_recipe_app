import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';

abstract class FollowRepository {
  Future<Either<Failure, void>> followUser({required FollowParams params});
  Future<Either<Failure, void>> unFollowUser({required FollowParams params});
  Future<Either<Failure, bool>> isFollowedUser({required FollowParams params});
  Future<Either<Failure, int>> getUserFollowed(
      {required FollowUserParams params});
  Future<Either<Failure, int>> getUserFollowers(
      {required FollowUserParams params});
}
