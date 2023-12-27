import 'package:flutter/material.dart';

class CRTitleProvider extends ChangeNotifier {
  String? _title;
  String? get title => _title;
  saveTitle(String? title) {
    _title = title;
    notifyListeners();
  }
}
