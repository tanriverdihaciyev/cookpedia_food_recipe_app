import 'package:cookpedia_foodrecipe_app/features/user_detail/domain/entities/user_detail_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_detail_repository.dart';

class GetUserDetail
    extends UseCase<Either<Failure, UserDetailEntity>, UserDetailParams> {
  GetUserDetail(this._repository);

  final UserDetailRepository _repository;

  @override
  Future<Either<Failure, UserDetailEntity>> call(
      UserDetailParams params) async {
    return await _repository.getUserDetail(params: params);
  }
}
