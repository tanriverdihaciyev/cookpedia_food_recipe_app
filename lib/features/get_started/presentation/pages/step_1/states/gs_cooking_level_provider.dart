import 'package:flutter/material.dart';

import '../models/cooking_level_model.dart';

class GSCookingLevelProvider extends ChangeNotifier {
  final List<GSCookingLevelModel> _levels = [
    GSCookingLevelModel(
        title: "Novice",
        describtion:
            "Basic understanding of kitchen tools and basic cooking techniques such as boiling and frying."),
  ];
  List<GSCookingLevelModel> get levels => _levels;
  GSCookingLevelModel? cookingLevelModel(int selectedLevel) =>
      _levels[selectedLevel];
}
