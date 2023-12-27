import 'package:flutter/material.dart';

class AppSnackBarProvider extends ChangeNotifier {
  String? _snackMessage;
  String? get snackMessage => _snackMessage;

  saveSnackMessage(String? message) {
    _snackMessage = message;
    notifyListeners();
  }

  bool _showSnackBar = false;
  bool get showSnackBar => _showSnackBar;

  changeShowSnackBar() {
    _showSnackBar = !_showSnackBar;
  }
}
