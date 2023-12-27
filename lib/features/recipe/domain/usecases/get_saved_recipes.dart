import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../saved_recipes/domain/entities/saved_recipe_enitity.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetSavedRecipes extends UseCase<Either<Failure, List<RecipeEntity>>,
    List<SavedRecipeEntity>> {
  GetSavedRecipes(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(
      List<SavedRecipeEntity> params) async {
    return await _repository.getSavedRecipes(params: params);
  }
}
