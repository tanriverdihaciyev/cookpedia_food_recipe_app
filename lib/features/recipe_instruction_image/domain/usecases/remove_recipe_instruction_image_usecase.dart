import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/recipe_instruction_image_repository.dart';

class RemoveRecipeInstructionImageUseCase
    extends UseCase<Either<Failure, void>, RemoveRecipeInstructionImageParams> {
  final RecipeInstructionImageRepository _repository;

  RemoveRecipeInstructionImageUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(
      RemoveRecipeInstructionImageParams params) async {
    return _repository.removeRecipeInstructionImage(params: params);
  }
}
