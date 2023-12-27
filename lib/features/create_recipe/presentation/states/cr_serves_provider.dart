import 'package:flutter/material.dart';

class CRServesProvider extends ChangeNotifier {
  String? _serves;
  String? get serves => _serves;
  saveServes(String? serves) {
    _serves = serves;
    notifyListeners();
  }
}
