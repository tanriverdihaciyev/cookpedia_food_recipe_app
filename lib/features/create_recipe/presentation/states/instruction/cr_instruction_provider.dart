import 'package:flutter/material.dart';

class CRInstructionProvider extends ChangeNotifier {
  String? _instruction;
  String? get instruction => _instruction;

  saveInstruction(String? instruction) {
    _instruction = instruction;
    notifyListeners();
  }
}
