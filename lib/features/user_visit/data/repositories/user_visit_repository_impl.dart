import '../../../../core/errors/exceptions.dart';
import '../data_sources/user_visit_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_visit_params.dart';
import '../../domain/repositories/user_visit_repository.dart';

class UserVisitRepositoryImpl implements UserVisitRepository {
  final UserVisitRemoteDataSource _remoteDataSource;

  UserVisitRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addUserVisit(
      {required UserVisitParams params}) async {
    try {
      final remoteUserVisit =
          await _remoteDataSource.addUserVisit(params: params);
      return Right(remoteUserVisit);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
