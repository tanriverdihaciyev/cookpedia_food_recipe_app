import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_params.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
  Future<Either<Failure, List<UserEntity>>> getTopUsers();
  Future<Either<Failure, void>> createUser({required UserEntity params});
  Future<Either<Failure, void>> updateUser({required UpdateUserParams params});
}
