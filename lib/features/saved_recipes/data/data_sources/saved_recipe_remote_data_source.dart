import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../models/saved_recipe_model.dart';

abstract class SavedRecipeRemoteDataSource {
  Future<void> saveRecipe({required SavedRecipeParams params});
  Future<void> unSaveRecipe({required SavedRecipeParams params});
  Future<bool> isSavedRecipe({required SavedRecipeParams params});
  Future<List<SavedRecipeModel>> getSavedRecipes(
      {required GetSaveRecipesParams params});
}

class SavedRecipeFireService implements SavedRecipeRemoteDataSource {
  final _savedRecipeFireService =
      FirebaseFirestore.instance.collection(kSavedRecipes);

  @override
  Future<List<SavedRecipeModel>> getSavedRecipes(
      {required GetSaveRecipesParams params}) async {
    final snapshot = await _savedRecipeFireService
        .doc(params.userID)
        .collection(kSavedRecipes)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((e) => SavedRecipeModel.fromDoc(e)).toList();
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<bool> isSavedRecipe({required SavedRecipeParams params}) async {
    final snapshot = await _savedRecipeFireService
        .doc(params.userID)
        .collection(kSavedRecipes)
        .doc(params.recipeID)
        .get();
    if (snapshot.exists) {
      return true;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> saveRecipe({required SavedRecipeParams params}) async {
    await _savedRecipeFireService
        .doc(params.userID)
        .collection(kSavedRecipes)
        .doc(params.recipeID)
        .set({})
        .then((value) => null)
        .onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
  }

  @override
  Future<void> unSaveRecipe({required SavedRecipeParams params}) async {
    await _savedRecipeFireService
        .doc(params.userID)
        .collection(kSavedRecipes)
        .doc(params.recipeID)
        .delete()
        .then((value) => null)
        .onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
  }
}
