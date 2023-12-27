import 'package:flutter/material.dart';

class GSFullNameProvider extends ChangeNotifier {
  String? _fullName;
  String? get fullName => _fullName;
  saveFullName(String? fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  resetFullName() {
    _fullName = null;
    notifyListeners();
  }
}
