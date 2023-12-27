import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/recipe_repository.dart';

class IsRecipeExists
    extends UseCase<Either<Failure, bool>, IsRecipeExistsParams> {
  IsRecipeExists(this._repository);
  final RecipeRepository _repository;

  @override
  Future<Either<Failure, bool>> call(IsRecipeExistsParams params) async {
    return await _repository.isRecipeExists(params: params);
  }
}
