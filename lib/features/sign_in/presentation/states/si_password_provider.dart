import 'package:flutter/material.dart';

class SIPasswordProvider extends ChangeNotifier {
  String? _password;
  String? get password => _password;
  addPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
