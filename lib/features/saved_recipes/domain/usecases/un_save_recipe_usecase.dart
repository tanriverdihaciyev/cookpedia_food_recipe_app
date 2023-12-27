import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/saved_recipe_repository.dart';

class UnSaveRecipeUseCase
    extends UseCase<Either<Failure, void>, SavedRecipeParams> {
  final SavedRecipeRepository _repository;

  UnSaveRecipeUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(SavedRecipeParams params) async {
    return await _repository.unSaveRecipe(params: params);
  }
}
