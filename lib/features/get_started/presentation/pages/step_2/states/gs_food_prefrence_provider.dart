import 'package:flutter/material.dart';

import '../../../../../../../core/resources/assets.dart';
import '../models/gs_food_prefrence_model.dart';

class GSFoodPrefrenceProvider extends ChangeNotifier {
  final List<GSFoodPrefrenceModel> _foodsPrefs = [
    GSFoodPrefrenceModel(image: AssetsPaths.az.flagToPath, name: "Salad"),
    GSFoodPrefrenceModel(image: AssetsPaths.az.flagToPath, name: "Egg"),
  ];

  List<GSFoodPrefrenceModel> get foodsPrefs => _foodsPrefs;

  final Set<GSFoodPrefrenceModel> _selectedsFoodPrefs = {};
  Set<GSFoodPrefrenceModel> get selectedsFoodPrefs => _selectedsFoodPrefs;

  setFoodPref(GSFoodPrefrenceModel prefrenceModel) {
    if (_selectedsFoodPrefs.contains(prefrenceModel)) {
      _selectedsFoodPrefs.removeWhere((element) => element == prefrenceModel);
    } else {
      _selectedsFoodPrefs.add(prefrenceModel);
    }
    notifyListeners();
  }

  bool isSelectedFoodPrefs(GSFoodPrefrenceModel prefrenceModel) {
    return _selectedsFoodPrefs.contains(prefrenceModel);
  }

  resetFoodPrefs() {
    _selectedsFoodPrefs.clear();
    notifyListeners();
  }
}
