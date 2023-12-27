class SavedRecipeParams {
  final String userID;
  final String recipeID;

  SavedRecipeParams({required this.userID, required this.recipeID});
}

class GetSaveRecipesParams {
  final String userID;

  GetSaveRecipesParams({
    required this.userID,
  });
}
