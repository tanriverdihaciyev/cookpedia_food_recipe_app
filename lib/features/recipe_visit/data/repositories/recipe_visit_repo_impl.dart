import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_visit_params.dart';
import '../../domain/repositories/recipe_visit_repository.dart';
import '../data_sources/recipe_visit_remote_data_source.dart';

class RecipeVisitRepositoryImpl implements RecipeVisitRepository {
  final RecipeVisitRemoteDataSource _remoteDataSource;

  RecipeVisitRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addRecipeVisit(
      {required RecipeVisitParams params}) async {
    try {
      final remoteVisitResult =
          await _remoteDataSource.addRecipeVisit(params: params);
      return Right(remoteVisitResult);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
