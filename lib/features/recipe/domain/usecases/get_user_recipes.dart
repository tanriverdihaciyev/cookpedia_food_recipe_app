import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetUserRecipes
    extends UseCase<Either<Failure, List<RecipeEntity>>, RecipeUserParams> {
  GetUserRecipes(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(
      RecipeUserParams params) async {
    return await _repository.getUserRecipes(params: params);
  }
}
