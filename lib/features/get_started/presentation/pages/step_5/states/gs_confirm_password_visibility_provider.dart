import 'package:flutter/material.dart';

class GSConfirmPasswordVisibilityPorvider extends ChangeNotifier {
  bool _confirmPasswordVisibility = false;
  bool get confirmPasswordVisibility => _confirmPasswordVisibility;
  changeConfirmPasswordVisibility() {
    _confirmPasswordVisibility = !_confirmPasswordVisibility;
    notifyListeners();
  }

  resetVisibilty() {
    _confirmPasswordVisibility = false;
    notifyListeners();
  }
}
