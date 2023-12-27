import 'package:flutter/material.dart';

class CRCookTimeProvider extends ChangeNotifier {
  String? _cookTime;
  String? get cookTime => _cookTime;
  saveCookTime(String? cookTime) {
    _cookTime = cookTime;
    notifyListeners();
  }
}
