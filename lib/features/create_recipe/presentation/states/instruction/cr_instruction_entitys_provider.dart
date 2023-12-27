import 'package:flutter/material.dart';

import '../../../../recipe/domain/entities/recipe_entity.dart';

class CRInstructionEntitysProvider extends ChangeNotifier {
  final List<InstructionEntity> _instructions = [];
  List<InstructionEntity> get instructions => _instructions;

  void addInstruction(InstructionEntity instruction) {
    if (!_instructions.contains(instruction)) {
      _instructions.add(instruction);
      notifyListeners();
    }
  }

  removeInstruction(int instructionID) {
    if (_instructions.isNotEmpty) {
      for (var element in _instructions) {
        if (element.id == instructionID) {
          _instructions.remove(element);
          notifyListeners();
        }
      }
    }
  }

  changeInstruction(
      InstructionEntity currentInstruction, InstructionEntity newInstruction) {
    int currentInstructionIndex = _instructions.indexOf(currentInstruction);
    _instructions[currentInstructionIndex] = newInstruction;
    notifyListeners();
  }
}
