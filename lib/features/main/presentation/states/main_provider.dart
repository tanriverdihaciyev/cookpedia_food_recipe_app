import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  changePage(int index) {
    _selectedPage = index;
    notifyListeners();
  }

  bool isSelectedPage(int index) => _selectedPage == index;
}
