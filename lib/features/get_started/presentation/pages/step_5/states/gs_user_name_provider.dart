import 'package:flutter/material.dart';

class GSUserNameProvider extends ChangeNotifier {
  String? _username;
  String? get username => _username;
  saveUserName(String? userName) {
    _username = userName;
    notifyListeners();
  }
}
