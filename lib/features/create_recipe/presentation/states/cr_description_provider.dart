import 'package:flutter/material.dart';

class CRDescriptionProvider extends ChangeNotifier {
  String? _description;
  String? get description => _description;
  saveDescription(String? description) {
    _description = description;
    notifyListeners();
  }
}
