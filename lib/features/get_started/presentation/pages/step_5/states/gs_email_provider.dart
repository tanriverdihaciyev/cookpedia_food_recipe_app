import 'package:flutter/material.dart';

class GSEmailProvider extends ChangeNotifier {
  String? _email;
  String? get email => _email;
  saveEmail(String? email) {
    _email = email;
    notifyListeners();
  }
}
