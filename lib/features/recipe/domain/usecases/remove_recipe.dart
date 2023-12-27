import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/recipe_repository.dart';

class RemoveRecipe extends UseCase<Either<Failure, void>, RecipeParams> {
  RemoveRecipe(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, void>> call(RecipeParams params) async {
    return await _repository.removeRecipe(params: params);
  }
}
