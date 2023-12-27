import '../../domain/entities/recipe_instruction_image_entity.dart';

class RecipeInstructionImageModel extends RecipeInstructionImageEntity {
  const RecipeInstructionImageModel({
    required String instructionImageURL,
  }) : super(
          instructionImageURL: instructionImageURL,
        );
}
