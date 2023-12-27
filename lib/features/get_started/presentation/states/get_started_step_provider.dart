import 'package:flutter/material.dart';

class GetStartedStepProvider extends ChangeNotifier {
  int _step = 0;

  int get step => _step;

  nextStep() {
    _step++;
    notifyListeners();
  }

  resetStep() {
    _step = 0;
    notifyListeners();
  }

  prevStep() {
    _step--;
    notifyListeners();
  }
}
