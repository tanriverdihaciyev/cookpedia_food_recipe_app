import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_visit_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/user_visit_repository.dart';
import 'package:dartz/dartz.dart';

class AddUserVisitUseCase
    extends UseCase<Either<Failure, void>, UserVisitParams> {
  final UserVisitRepository repository;

  AddUserVisitUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call(UserVisitParams params) async {
    return await repository.addUserVisit(params: params);
  }
}
