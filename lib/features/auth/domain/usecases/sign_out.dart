import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/void_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SignOut extends UseCase<Either<Failure, void>, VoidParams> {
  SignOut(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(VoidParams params) async {
    return await _repository.signOut();
  }
}
