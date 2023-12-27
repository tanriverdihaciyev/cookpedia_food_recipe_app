import 'package:flutter/material.dart';

class MRSearchProvider extends ChangeNotifier {
  bool _isSearch = false;
  bool get isSearch => _isSearch;

  changeSearch() {
    _isSearch = !isSearch;
    notifyListeners();
  }

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  changeSelectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  String? _searchContent;
  String? get searchContent => _searchContent;
  setSearchContent(String? text) {
    _searchContent = text;
    notifyListeners();
  }
}
