import 'package:flutter/material.dart';

class GSDateOfBirthProvider extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  saveDateOfBirth(DateTime? dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  resetDate() {
    _dateOfBirth = null;
    notifyListeners();
  }
}
