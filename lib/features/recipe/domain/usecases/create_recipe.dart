import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class CreateRecipe extends UseCase<Either<Failure, void>, RecipeEntity> {
  CreateRecipe(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, void>> call(RecipeEntity params) async {
    return await _repository.createRecipe(params: params);
  }
}
