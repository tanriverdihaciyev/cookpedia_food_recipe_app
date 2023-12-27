import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/void_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignInOrUpGmail extends UseCase<Either<Failure, AuthEntity>, VoidParams> {
  final AuthRepository _repository;

  SignInOrUpGmail(this._repository);
  @override
  Future<Either<Failure, AuthEntity>> call(VoidParams params) async {
    return await _repository.signInGmail();
  }
}
