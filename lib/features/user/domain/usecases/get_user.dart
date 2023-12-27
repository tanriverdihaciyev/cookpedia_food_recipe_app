import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUser extends UseCase<Either<Failure, UserEntity>, UserParams> {
  GetUser(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) async {
    return await _repository.getUser(params: params);
  }
}
