import 'package:flutter/material.dart';

class SIEmailOrUserNameProvider extends ChangeNotifier {
  String? _userNameEmail;

  String? get userNameEmail => _userNameEmail;
  addEmailUserName(String value) {
    _userNameEmail = value;
    notifyListeners();
  }
}
