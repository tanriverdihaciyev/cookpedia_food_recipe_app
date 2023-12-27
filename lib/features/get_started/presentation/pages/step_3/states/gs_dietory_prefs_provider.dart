import 'package:flutter/material.dart';

import '../../../../../../../core/resources/assets.dart';
import '../models/gs_dietory_prefs_model.dart';

class GSDietoryPrefsProvider extends ChangeNotifier {
  final List<GSDietoryPrefsModel> _dietoryPrefs = [
    GSDietoryPrefsModel(
      title: "Vegetarian",
      image: AssetsPaths.az.flagToPath,
    ),
    GSDietoryPrefsModel(
      title: "Vegan",
      image: AssetsPaths.az.flagToPath,
    ),
  ];

  List<GSDietoryPrefsModel> get dietoryPrefs => _dietoryPrefs;
  final Set<GSDietoryPrefsModel> _selectedsDietoryPrefs = {};
  Set<GSDietoryPrefsModel> get selectedsDietoryPrefs => _selectedsDietoryPrefs;
  setDietPref(GSDietoryPrefsModel dietoryPrefs) {
    if (_selectedsDietoryPrefs.contains(dietoryPrefs)) {
      _selectedsDietoryPrefs.removeWhere((element) => element == dietoryPrefs);
    } else {
      _selectedsDietoryPrefs.add(dietoryPrefs);
    }
    notifyListeners();
  }

  bool isSelectedDietPrefs(GSDietoryPrefsModel dietoryPrefs) {
    return _selectedsDietoryPrefs.contains(dietoryPrefs);
  }

  resetDietPrefs() {
    _selectedsDietoryPrefs.clear();
    notifyListeners();
  }
}
