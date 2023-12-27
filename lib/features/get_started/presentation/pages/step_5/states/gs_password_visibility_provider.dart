import 'package:flutter/material.dart';

class GSPasswordVisibilityPorvider extends ChangeNotifier {
  bool _visibility = false;
  bool get visibility => _visibility;
  changeVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }

  resetVisibilty() {
    _visibility = false;
    notifyListeners();
  }
}
