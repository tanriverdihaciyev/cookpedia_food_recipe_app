import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_instruction_image_entity.dart';
import '../repositories/recipe_instruction_image_repository.dart';

class AddRecipeInstructionImageUseCase extends UseCase<
    Either<Failure, RecipeInstructionImageEntity>,
    RecipeInstructionImageParams> {
  final RecipeInstructionImageRepository _repository;

  AddRecipeInstructionImageUseCase(this._repository);
  @override
  Future<Either<Failure, RecipeInstructionImageEntity>> call(
      RecipeInstructionImageParams params) async {
    return _repository.addRecipeInstructionImage(params: params);
  }
}
