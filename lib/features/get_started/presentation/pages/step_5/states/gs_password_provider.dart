import 'package:flutter/material.dart';

class GSPasswordProvider extends ChangeNotifier {
  String? _password;
  String? get password => _password;
  savePassword(String? password) {
    _password = password;
    notifyListeners();
  }
}
