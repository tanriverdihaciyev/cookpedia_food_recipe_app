import 'package:flutter/material.dart';

class CROriginProvider extends ChangeNotifier {
  String? _location;
  String? get location => _location;
  saveLocation(String? location) {
    _location = location;
    notifyListeners();
  }
}
