import 'package:flutter/material.dart';

class SILoadingProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
