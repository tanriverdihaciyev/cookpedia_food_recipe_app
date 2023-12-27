import 'package:flutter/material.dart';

class GSRememberProvider extends ChangeNotifier {
  bool _isRemember = false;
  bool get isRemember => _isRemember;
  changeRemember() {
    _isRemember = !_isRemember;
    notifyListeners();
  }

  resetRemember() {
    _isRemember = false;
    notifyListeners();
  }
}
