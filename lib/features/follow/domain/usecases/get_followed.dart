import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/follow_repository.dart';

class GetFollowed extends UseCase<Either<Failure, int>, FollowUserParams> {
  GetFollowed(this._repository);
  final FollowRepository _repository;

  @override
  Future<Either<Failure, int>> call(FollowUserParams params) async {
    return await _repository.getUserFollowed(params: params);
  }
}
