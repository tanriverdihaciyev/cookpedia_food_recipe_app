import 'package:cookpedia_foodrecipe_app/features/saved_recipes/domain/entities/saved_recipe_enitity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../entities/recipe_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepository {
  Future<Either<Failure, void>> createRecipe({required RecipeEntity params});
  Future<Either<Failure, RecipeEntity>> getRecipe(
      {required RecipeParams params});
  Future<Either<Failure, bool>> isRecipeExists(
      {required IsRecipeExistsParams params});
  Future<Either<Failure, List<RecipeEntity>>> getUserRecipes(
      {required RecipeUserParams params});
  Future<Either<Failure, void>> removeRecipe({required RecipeParams params});

  Future<Either<Failure, List<RecipeEntity>>> getMostPopularRecipes();
  Future<Either<Failure, List<RecipeEntity>>> getRecentRecipes(
      {required RecentRecipeParams params});
  Future<Either<Failure, List<RecipeEntity>>> getSavedRecipes(
      {required List<SavedRecipeEntity> params});
}
