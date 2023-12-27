import 'package:flutter/material.dart';

class CRIngredientsLenghtProvider extends ChangeNotifier {
  int _ingredentsLenght = 1;
  int get ingredentsLenght => _ingredentsLenght;
  incIngredentsLenght() {
    _ingredentsLenght++;
    notifyListeners();
  }

  dicIngredentsLenght() {
    if (_ingredentsLenght != 1) {
      _ingredentsLenght--;
      notifyListeners();
    }
  }
}
