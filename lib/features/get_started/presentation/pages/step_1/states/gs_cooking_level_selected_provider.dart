import 'package:flutter/material.dart';

class GSCookingLevelSelectedProvider extends ChangeNotifier {
  int? _selectedLevel;

  int? get selectedLevel => _selectedLevel;

  resetLevel() {
    _selectedLevel = null;
    notifyListeners();
  }

  selectLevel(int index) {
    if (index == _selectedLevel) {
      _selectedLevel = null;
    } else {
      _selectedLevel = index;
    }
    notifyListeners();
  }
}
