import 'package:cookpedia_foodrecipe_app/core/params/user_detail_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_detail_repository.dart';

class UpdateUserDetail
    extends UseCase<Either<Failure, void>, UpdateUserDetailParams> {
  UpdateUserDetail(this._repository);

  final UserDetailRepository _repository;

  @override
  Future<Either<Failure, void>> call(UpdateUserDetailParams params) async {
    return await _repository.updateUserDetail(params: params);
  }
}
