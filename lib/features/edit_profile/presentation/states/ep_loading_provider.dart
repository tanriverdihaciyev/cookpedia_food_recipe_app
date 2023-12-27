import 'package:flutter/material.dart';

class EPLoadingProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  changeLoading() {
    _loading = !_loading;
    notifyListeners();
  }
}
