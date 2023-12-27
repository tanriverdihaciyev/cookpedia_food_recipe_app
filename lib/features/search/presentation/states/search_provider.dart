import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  bool _isRecipes = true;
  bool get isRecipes => _isRecipes;
  changeSearchBool(bool value) {
    _isRecipes = value;
    notifyListeners();
  }

  String? _searchText;
  String? get searchText => _searchText;
  setSearchText(String? text) {
    _searchText = text;
    notifyListeners();
  }
}
