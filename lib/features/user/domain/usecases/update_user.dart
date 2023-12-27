import 'package:cookpedia_foodrecipe_app/core/params/user_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class UpdateUser extends UseCase<Either<Failure, void>, UpdateUserParams> {
  UpdateUser(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, void>> call(UpdateUserParams params) async {
    return await _repository.updateUser(params: params);
  }
}
