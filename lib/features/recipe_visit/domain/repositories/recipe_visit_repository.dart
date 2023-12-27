import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_visit_params.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeVisitRepository {
  Future<Either<Failure, void>> addRecipeVisit(
      {required RecipeVisitParams params});
}
