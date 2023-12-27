import 'package:flutter/material.dart';

class FPFormKeyProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> get key => _key;
}

class FPLoadingProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

class FPEmailProvider extends ChangeNotifier {
  String? _email;
  String? get email => _email;
  saveEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
