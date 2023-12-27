import 'package:flutter/material.dart';

class GSConfirmPasswordProvider extends ChangeNotifier {
  String? _confirmPassword;
  String? get confirmPassword => _confirmPassword;
  saveConfirmPassword(String? confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
}
