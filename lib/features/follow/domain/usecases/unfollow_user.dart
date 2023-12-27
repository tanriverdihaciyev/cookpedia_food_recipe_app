import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/follow_repository.dart';

class UnfollowUser extends UseCase<Either<Failure, void>, FollowParams> {
  UnfollowUser(this._repository);
  final FollowRepository _repository;

  @override
  Future<Either<Failure, void>> call(FollowParams params) async {
    return await _repository.unFollowUser(params: params);
  }
}
