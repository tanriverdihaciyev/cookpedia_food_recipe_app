import 'package:flutter/material.dart';

class EPDisplayNameProvider extends ChangeNotifier {
  String? _displayName;
  String? get displayName => _displayName;
  void setDisplayName(String? newName) {
    _displayName = newName;
    notifyListeners();
  }
}
