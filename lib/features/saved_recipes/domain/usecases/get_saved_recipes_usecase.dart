import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/saved_recipe_enitity.dart';
import '../repositories/saved_recipe_repository.dart';

class GetSavedRecipesUseCase extends UseCase<
    Either<Failure, List<SavedRecipeEntity>>, GetSaveRecipesParams> {
  final SavedRecipeRepository _repository;

  GetSavedRecipesUseCase(this._repository);

  @override
  Future<Either<Failure, List<SavedRecipeEntity>>> call(
      GetSaveRecipesParams params) async {
    return await _repository.getSavedRecipes(params: params);
  }
}
