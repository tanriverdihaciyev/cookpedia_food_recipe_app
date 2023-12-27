import 'package:dartz/dartz.dart';

import '../../domain/usecases/is_saved_recipe_usecase.dart';
import '../../domain/usecases/save_recipe_usecase.dart';
import '../../domain/usecases/un_save_recipe_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../data/data_sources/saved_recipe_remote_data_source.dart';
import '../../data/repositories/saved_recipe_repository_impl.dart';
import '../../domain/entities/saved_recipe_enitity.dart';
import '../../domain/repositories/saved_recipe_repository.dart';
import '../../domain/usecases/get_saved_recipes_usecase.dart';

class SavedRecipeProvider extends ChangeNotifier {
  List<SavedRecipeEntity>? savedRecipes;
  Failure? savedRecipesFailure;
  bool? isSavedRecipe;
  Failure? isSavedRecipeFailure;
  Failure? saveRecipeFailure;
  Failure? unSaveRecipeFailure;

  Future<void> eitherGetSavedRecipes(
      {required GetSaveRecipesParams params}) async {
    SavedRecipeRepository repository = SavedRecipeRepositoryImpl(
      SavedRecipeFireService(),
    );

    final eitherSavedRecipesOrFailure =
        await GetSavedRecipesUseCase(repository).call(params);

    eitherSavedRecipesOrFailure.fold((l) {
      savedRecipes = null;
      savedRecipesFailure = l;
      notifyListeners();
    }, (r) {
      savedRecipes = r;
      savedRecipesFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherIsSavedRecipe({required SavedRecipeParams params}) async {
    SavedRecipeRepository repository = SavedRecipeRepositoryImpl(
      SavedRecipeFireService(),
    );

    final eitherSavedRecipesOrFailure =
        await IsSavedRecipeUseCase(repository).call(params);

    eitherSavedRecipesOrFailure.fold((l) {
      isSavedRecipe = null;
      isSavedRecipeFailure = l;
      notifyListeners();
    }, (r) {
      isSavedRecipe = r;
      isSavedRecipeFailure = null;
      notifyListeners();
    });
  }

  Future<Either<Failure, bool>> eitherIsSavedorFailureRecipe(
      {required SavedRecipeParams params}) async {
    SavedRecipeRepository repository = SavedRecipeRepositoryImpl(
      SavedRecipeFireService(),
    );

    return await IsSavedRecipeUseCase(repository).call(params);
  }

  Future<void> eitherSaveRecipe({required SavedRecipeParams params}) async {
    SavedRecipeRepository repository = SavedRecipeRepositoryImpl(
      SavedRecipeFireService(),
    );

    final eitherSavedRecipesOrFailure =
        await SaveRecipeUseCase(repository).call(params);

    eitherSavedRecipesOrFailure.fold((l) {
      saveRecipeFailure = l;
      notifyListeners();
    }, (r) {
      saveRecipeFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherUnSaveRecipe({required SavedRecipeParams params}) async {
    SavedRecipeRepository repository = SavedRecipeRepositoryImpl(
      SavedRecipeFireService(),
    );

    final eitherSavedRecipesOrFailure =
        await UnSaveRecipeUseCase(repository).call(params);

    eitherSavedRecipesOrFailure.fold((l) {
      unSaveRecipeFailure = l;
      notifyListeners();
    }, (r) {
      unSaveRecipeFailure = null;
      notifyListeners();
    });
  }
}
