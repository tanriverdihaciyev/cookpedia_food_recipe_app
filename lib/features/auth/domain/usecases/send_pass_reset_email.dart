import 'package:cookpedia_foodrecipe_app/core/params/email_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPassResetEmail extends UseCase<Either<Failure, void>, EmailParams> {
  SendPassResetEmail(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(EmailParams params) async {
    return await _repository.sendPassResetEmail(params: params);
  }
}
