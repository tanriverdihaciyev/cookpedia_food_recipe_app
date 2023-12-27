import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/void_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetMostPopularRecipes
    extends UseCase<Either<Failure, List<RecipeEntity>>, VoidParams> {
  GetMostPopularRecipes(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(VoidParams params) async {
    return await _repository.getMostPopularRecipes();
  }
}
