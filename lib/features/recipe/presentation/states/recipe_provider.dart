import 'package:cookpedia_foodrecipe_app/features/recipe/domain/usecases/get_recent_recipes.dart';
import 'package:cookpedia_foodrecipe_app/features/recipe/domain/usecases/get_saved_recipes.dart';
import 'package:cookpedia_foodrecipe_app/features/saved_recipes/domain/entities/saved_recipe_enitity.dart';

import '../../../../core/params/void_params.dart';
import '../../domain/usecases/get_most_popular_recipes.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../data/data_sources/recipe_remote_data_source.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import '../../domain/entities/recipe_entity.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/usecases/create_recipe.dart';
import '../../domain/usecases/get_recipe.dart';
import '../../domain/usecases/get_user_recipes.dart';
import '../../domain/usecases/is_recipe_exists.dart';
import '../../domain/usecases/remove_recipe.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeEntity? recipe;
  Failure? failure;

  bool? isRecipeExists;
  Failure? isRecipeExistsFailure;

  List<RecipeEntity>? recipes;
  Failure? recipesFailure;

  List<RecipeEntity>? savedRecipes;
  Failure? savedRecipesFailure;

  List<RecipeEntity>? recentRecipes;
  Failure? recentRecipesFailure;

  List<RecipeEntity>? otherRecipes;
  Failure? otherRecipesFailure;

  List<RecipeEntity>? mostPopularRecipes;
  Failure? mostPopularRecipesFailure;

  void resetRecipes() {
    otherRecipes = null;
    otherRecipesFailure = null;
    notifyListeners();
  }

  Future<void> eitherCreateRecipeVoidOrFailure(
      {required RecipeEntity params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());

    final eitherVoidOrFailure = await CreateRecipe(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      recipe = null;
      failure = newFailure;
      notifyListeners();
    }, (void result) {
      recipe = null;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherRemoveRecipeVoidOrFailure(
      {required RecipeParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());

    final eitherVoidOrFailure = await RemoveRecipe(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      recipe = null;
      failure = newFailure;
      notifyListeners();
    }, (void result) {
      recipe = null;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetRecipeOrFailure({required RecipeParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());

    final eitherVoidOrFailure = await GetRecipe(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      recipe = null;
      failure = newFailure;
      notifyListeners();
    }, (RecipeEntity newRecipe) {
      recipe = newRecipe;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherIsRecipeExists(
      {required IsRecipeExistsParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());

    final eitherVoidOrFailure = await IsRecipeExists(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      isRecipeExists = null;
      isRecipeExistsFailure = newFailure;
      notifyListeners();
    }, (bool newRecipe) {
      isRecipeExists = newRecipe;
      isRecipeExistsFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetUserRecipesOrFailure(
      {required RecipeUserParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());
    final eitherVoidOrFailure = await GetUserRecipes(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      recipes = null;
      recipesFailure = newFailure;
      notifyListeners();
    }, (List<RecipeEntity> newRecipe) {
      recipes = newRecipe;
      recipesFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherOtherUserRecipesOrFailure(
      {required RecipeUserParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());
    final eitherVoidOrFailure = await GetUserRecipes(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      otherRecipes = null;
      otherRecipesFailure = newFailure;
      notifyListeners();
    }, (List<RecipeEntity> newRecipe) {
      otherRecipes = newRecipe;
      otherRecipesFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetMostPopularRecipesOrFailure() async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());
    final eitherVoidOrFailure =
        await GetMostPopularRecipes(repository).call(VoidParams());

    eitherVoidOrFailure.fold((Failure newFailure) {
      mostPopularRecipes = null;
      mostPopularRecipesFailure = newFailure;
      notifyListeners();
    }, (List<RecipeEntity> newRecipe) {
      mostPopularRecipes = newRecipe;
      mostPopularRecipesFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetRecentRecipesOrFailure(
      {required RecentRecipeParams params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());
    final eitherVoidOrFailure = await GetRecentRecipes(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      recentRecipes = null;
      recentRecipesFailure = newFailure;
      notifyListeners();
    }, (List<RecipeEntity> newRecipe) {
      recentRecipes = newRecipe;
      recentRecipesFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetSavedRecipesOrFailure(
      {required List<SavedRecipeEntity> params}) async {
    RecipeRepository repository = RecipeRepositoryImpl(RecipeFirebaseService());
    final eitherVoidOrFailure = await GetSavedRecipes(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      savedRecipes = null;
      savedRecipesFailure = newFailure;
      notifyListeners();
    }, (List<RecipeEntity> newRecipe) {
      savedRecipes = newRecipe;
      savedRecipesFailure = null;
      notifyListeners();
    });
  }
}
