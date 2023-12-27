import 'package:flutter/material.dart';

class CRInstructionAllFieldFormKeyProvider extends ChangeNotifier {
  final List<GlobalKey<FormState>> _forms = [GlobalKey<FormState>()];
  List<GlobalKey<FormState>> get forms => _forms;

  addKey() {
    _forms.add(
      GlobalKey<FormState>(),
    );
    notifyListeners();
  }

  removeKey() {
    if (_forms.length > 1) {
      _forms.removeLast();
      notifyListeners();
    }
  }

  allValidateSave() {
    for (var element in _forms) {
      if (element.currentState != null) {
        if (element.currentState!.validate()) {
          element.currentState?.save();
        }
      }
    }
  }
}
