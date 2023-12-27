import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IngredientsModel extends Equatable {
  final int index;
  final String ingredients;

  const IngredientsModel({required this.index, required this.ingredients});

  @override
  List<Object?> get props => [
        ingredients,
        index,
      ];
}

class CRIngredientsProvider extends ChangeNotifier {
  final List<IngredientsModel> _ingredients = [];
  List<IngredientsModel> get ingredients => _ingredients;
  addIngredients(String ingredients, int index) {
    if (!_ingredients
        .contains(IngredientsModel(index: index, ingredients: ingredients))) {
      _ingredients
          .add(IngredientsModel(ingredients: ingredients, index: index));
      notifyListeners();
    }
  }

  removeIngredients(String ingredients, int index) {
    _ingredients
        .remove(IngredientsModel(ingredients: ingredients, index: index));
    notifyListeners();
  }

  changeIngredients(String currentIngredients, int currentIndex,
      String ingredients, int ingredientIndex) {
    int currentIngredientsIndex = _ingredients.indexOf(
        IngredientsModel(ingredients: currentIngredients, index: currentIndex));
    _ingredients[currentIngredientsIndex] =
        (IngredientsModel(ingredients: ingredients, index: ingredientIndex));
    notifyListeners();
  }
}
