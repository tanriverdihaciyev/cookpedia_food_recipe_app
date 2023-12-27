import 'package:flutter/material.dart';

class CRInstructionLenghtProvider extends ChangeNotifier {
  int _instructionLenght = 1;
  int get instructionLenght => _instructionLenght;

  incInstructionLenght() {
    _instructionLenght++;
    notifyListeners();
  }

  decInstructionLenght() {
    if (_instructionLenght != 1) {
      _instructionLenght--;
      notifyListeners();
    }
  }
}
