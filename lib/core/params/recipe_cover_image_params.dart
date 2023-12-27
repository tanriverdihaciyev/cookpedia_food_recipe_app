import 'dart:io';

class RecipeCoverImageParams {
  final File imagePath;
  final String userID;

  RecipeCoverImageParams({
    required this.imagePath,
    required this.userID,
  });
}

class RemoveRecipeCoverImageParams {
  final String recipeCoverImageUrl;
  final String userID;

  RemoveRecipeCoverImageParams({
    required this.recipeCoverImageUrl,
    required this.userID,
  });
}
