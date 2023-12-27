import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignInEmailPassword
    extends UseCase<Either<Failure, AuthEntity>, AuthParams> {
  final AuthRepository _repository;

  SignInEmailPassword(this._repository);
  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    return await _repository.signInEmailAndPassword(params: params);
  }
}
