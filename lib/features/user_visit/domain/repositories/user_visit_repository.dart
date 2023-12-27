import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_visit_params.dart';
import 'package:dartz/dartz.dart';

abstract class UserVisitRepository {
  Future<Either<Failure, void>> addUserVisit({required UserVisitParams params});
}
