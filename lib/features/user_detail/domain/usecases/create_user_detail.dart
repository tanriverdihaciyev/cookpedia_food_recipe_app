import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_detail_entity.dart';
import '../repositories/user_detail_repository.dart';

class CreateUserDetail
    extends UseCase<Either<Failure, void>, UserDetailEntity> {
  CreateUserDetail(this._repository);

  final UserDetailRepository _repository;

  @override
  Future<Either<Failure, void>> call(UserDetailEntity params) async {
    return await _repository.createUserDetail(params: params);
  }
}
