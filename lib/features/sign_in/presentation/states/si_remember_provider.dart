import 'package:flutter/material.dart';

class SIRememberProvider extends ChangeNotifier {
  bool _isRemember = false;
  bool get isRemember => _isRemember;

  changeRemember() {
    _isRemember = !_isRemember;
    notifyListeners();
  }
}
