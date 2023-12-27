import 'package:flutter/material.dart';

import '../../../recipe/domain/entities/recipe_entity.dart';

class RecipeViewProvider extends ChangeNotifier {
  late RecipeEntity _recipe;
  RecipeEntity get recipe => _recipe;

  setParams(RecipeEntity recipe) {
    _recipe = recipe;
    notifyListeners();
  }
}
