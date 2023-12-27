import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/follow_repository.dart';

class IsFollowUser extends UseCase<Either<Failure, bool>, FollowParams> {
  IsFollowUser(this._repository);
  final FollowRepository _repository;

  @override
  Future<Either<Failure, bool>> call(FollowParams params) async {
    return await _repository.isFollowedUser(params: params);
  }
}
