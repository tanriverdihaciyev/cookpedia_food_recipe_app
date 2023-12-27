import 'package:cookpedia_foodrecipe_app/core/errors/failures.dart';
import 'package:cookpedia_foodrecipe_app/features/user_detail/domain/entities/user_detail_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/user_detail_params.dart';

abstract class UserDetailRepository {
  Future<Either<Failure, void>> createUserDetail(
      {required UserDetailEntity params});
  Future<Either<Failure, UserDetailEntity>> getUserDetail(
      {required UserDetailParams params});
  Future<Either<Failure, void>> updateUserDetail(
      {required UpdateUserDetailParams params});
}
