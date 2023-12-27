import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/saved_recipe_repository.dart';

class IsSavedRecipeUseCase
    extends UseCase<Either<Failure, bool>, SavedRecipeParams> {
  final SavedRecipeRepository _repository;

  IsSavedRecipeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(SavedRecipeParams params) async {
    return await _repository.isSavedRecipe(params: params);
  }
}
