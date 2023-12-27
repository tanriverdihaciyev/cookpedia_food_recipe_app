import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../saved_recipes/domain/entities/saved_recipe_enitity.dart';
import '../models/recipe_model.dart';

abstract class RecipeRemoteDataSource {
  Future<void> createRecipe({required RecipeModel params});
  Future<RecipeModel> getRecipe({required RecipeParams params});
  Future<List<RecipeModel>> getUserRecipes({required RecipeUserParams params});
  Future<List<RecipeModel>> getMostPopularRecipes();
  Future<void> removeRecipe({required RecipeParams params});
  Future<bool> isRecipeExists({required IsRecipeExistsParams params});
  Future<List<RecipeModel>> getRecentRecipes(
      {required RecentRecipeParams params});
  Future<List<RecipeModel>> getSavedRecipes(
      {required List<SavedRecipeEntity> params});
}

class RecipeFirebaseService implements RecipeRemoteDataSource {
  final _recipeService = FirebaseFirestore.instance;

  @override
  Future<void> createRecipe({required RecipeModel params}) async {
    await _recipeService
        .collection(kRecipes)
        .doc(params.sharedUserId)
        .collection(kUserRecipes)
        .add(
          params.toJson(),
        )
        .then((value) => null)
        .onError((error, stackTrace) {
      throw FirebaseServerException();
    });
  }

  @override
  Future<RecipeModel> getRecipe({required RecipeParams params}) async {
    final snap = await _recipeService
        .collection(kRecipes)
        .doc(params.sharedUserId)
        .collection(kUserRecipes)
        .doc(params.recipeId)
        .get();
    if (snap.exists) {
      return RecipeModel.fromDoc(snap);
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<List<RecipeModel>> getUserRecipes(
      {required RecipeUserParams params}) async {
    final snap = await _recipeService
        .collection(kRecipes)
        .doc(params.sharedUserID)
        .collection(kUserRecipes)
        .get();
    if (snap.docs.isNotEmpty) {
      return snap.docs.map((e) => RecipeModel.fromDoc(e)).toList();
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> removeRecipe({required RecipeParams params}) async {
    await _recipeService
        .collection(kRecipes)
        .doc(params.sharedUserId)
        .collection(kUserRecipes)
        .doc(params.recipeId)
        .delete()
        .then((value) => null)
        .onError((error, stackTrace) {
      throw FirebaseServerException();
    });
  }

  @override
  Future<bool> isRecipeExists({required IsRecipeExistsParams params}) async {
    final snap = await _recipeService
        .collection(kRecipes)
        .doc(params.sharedUserId)
        .collection(kUserRecipes)
        .doc(params.recipeId)
        .get();
    if (snap.exists) {
      return snap.exists;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<List<RecipeModel>> getMostPopularRecipes() async {
    final snap = await _recipeService.collectionGroup(kUserRecipes).get();
    if (snap.docs.isNotEmpty) {
      return snap.docs.map((e) => RecipeModel.fromDoc(e)).toList();
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<List<RecipeModel>> getRecentRecipes(
      {required RecentRecipeParams params}) async {
    RegExp search = RegExp(r'recipeVisits/.+/.+');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _recipeService
        .collectionGroup(kVisitors)
        .get()
        .onError((error, stackTrace) => throw FirebaseServerException());
    var userVisitDatas = querySnapshot.docs
        .where((element) => element.id == params.userID)
        .toList();
    List<String> datas = [];
    for (var element in userVisitDatas) {
      var equal = search.firstMatch(element.reference.path);
      String? id = equal?[0]?.split("/")[1];
      if (id != null) {
        datas.add(id);
      }
    }
    var recipesSnap = await _recipeService
        .collectionGroup(kUserRecipes)
        .get()
        .onError((error, stackTrace) => throw FirebaseServerException());

    List<RecipeModel> recipes = [];
    for (var id in datas) {
      for (var element in recipesSnap.docs) {
        if (element.id == id) {
          recipes.add(RecipeModel.fromDoc(element));
        }
      }
    }
    if (recipes.isNotEmpty) {
      return recipes;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<List<RecipeModel>> getSavedRecipes(
      {required List<SavedRecipeEntity> params}) async {
    List<RecipeModel> recipes = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _recipeService.collectionGroup(kUserRecipes).get().onError(
              (error, stackTrace) => throw FirebaseServerException(),
            );
    for (var savedRecipe in params) {
      for (var recipe in querySnapshot.docs) {
        if (savedRecipe.savedRecipeID == recipe.id) {
          recipes.add(RecipeModel.fromDoc(recipe));
        }
      }
    }
    if (recipes.isNotEmpty) {
      return recipes;
    } else {
      throw FirebaseServerException();
    }
  }
}
