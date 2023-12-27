import '../../../../core/errors/failures.dart';
import '../../../../core/params/void_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopUsers
    extends UseCase<Either<Failure, List<UserEntity>>, VoidParams> {
  final UserRepository repository;

  GetTopUsers(this.repository);
  @override
  Future<Either<Failure, List<UserEntity>>> call(VoidParams params) async {
    return await repository.getTopUsers();
  }
}
