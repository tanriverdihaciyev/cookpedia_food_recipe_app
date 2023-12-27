import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../entities/recipe_instruction_image_entity.dart';

abstract class RecipeInstructionImageRepository {
  Future<Either<Failure, RecipeInstructionImageEntity>>
      addRecipeInstructionImage({required RecipeInstructionImageParams params});
  Future<Either<Failure, void>> removeRecipeInstructionImage(
      {required RemoveRecipeInstructionImageParams params});
}
