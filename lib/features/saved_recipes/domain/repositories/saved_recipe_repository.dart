import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../entities/saved_recipe_enitity.dart';

abstract class SavedRecipeRepository {
  Future<Either<Failure, void>> saveRecipe({required SavedRecipeParams params});
  Future<Either<Failure, void>> unSaveRecipe(
      {required SavedRecipeParams params});
  Future<Either<Failure, List<SavedRecipeEntity>>> getSavedRecipes(
      {required GetSaveRecipesParams params});
  Future<Either<Failure, bool>> isSavedRecipe(
      {required SavedRecipeParams params});
}
