import 'package:flutter/material.dart';

class GSGenderProvider extends ChangeNotifier {
  String? _gender;
  String? get gender => _gender;
  saveGender(String? gender) {
    _gender = gender;
    notifyListeners();
  }

  resetGender() {
    _gender = null;
    notifyListeners();
  }
}
