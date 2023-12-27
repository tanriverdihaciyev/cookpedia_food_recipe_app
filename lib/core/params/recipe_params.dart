class RecipeParams {
  final String sharedUserId;
  final String recipeId;

  RecipeParams({required this.sharedUserId, required this.recipeId});
}

class RecipeUserParams {
  final String sharedUserID;

  RecipeUserParams({required this.sharedUserID});
}

class IsRecipeExistsParams {
  final String sharedUserId;
  final String? recipeId;

  IsRecipeExistsParams({required this.sharedUserId, this.recipeId});
}

class RecentRecipeParams {
  final String userID;

  RecentRecipeParams({required this.userID});
}
