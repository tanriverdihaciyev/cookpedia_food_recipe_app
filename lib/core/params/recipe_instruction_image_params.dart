import 'dart:io';

class RecipeInstructionImageParams {
  final File instructionImage;
  final String userID;

  const RecipeInstructionImageParams(
      {required this.instructionImage, required this.userID});
}

class RemoveRecipeInstructionImageParams {
  final String instructionImageURL;
  final String userID;

  const RemoveRecipeInstructionImageParams(
      {required this.instructionImageURL, required this.userID});
}
