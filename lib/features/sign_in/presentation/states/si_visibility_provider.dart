import 'package:flutter/material.dart';

class SIVisibilityProvider extends ChangeNotifier {
  bool _visibility = false;
  bool get visibility => _visibility;
  changeVisibilty() {
    _visibility = !_visibility;
    notifyListeners();
  }
}
