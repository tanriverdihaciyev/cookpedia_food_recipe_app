import 'package:flutter/material.dart';

class GSPhoneNumberProvider extends ChangeNotifier {
  int? _phoneNumber;
  int? get phoneNumber => _phoneNumber;
  savePhoneNumber(int? phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  resetNumber() {
    _phoneNumber = null;
    notifyListeners();
  }
}
