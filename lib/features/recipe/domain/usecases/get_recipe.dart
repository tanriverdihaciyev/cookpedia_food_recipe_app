import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetRecipe extends UseCase<Either<Failure, RecipeEntity>, RecipeParams> {
  GetRecipe(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, RecipeEntity>> call(RecipeParams params) async {
    return await _repository.getRecipe(params: params);
  }
}
