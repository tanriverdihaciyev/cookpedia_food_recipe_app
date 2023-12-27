import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class CreateUser extends UseCase<Either<Failure, void>, UserEntity> {
  CreateUser(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, void>> call(UserEntity params) async {
    return await _repository.createUser(params: params);
  }
}
