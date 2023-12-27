import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetRecentRecipes
    extends UseCase<Either<Failure, List<RecipeEntity>>, RecentRecipeParams> {
  GetRecentRecipes(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(
      RecentRecipeParams params) async {
    return await _repository.getRecentRecipes(params: params);
  }
}
