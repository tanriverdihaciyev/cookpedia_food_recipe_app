import 'package:flutter/material.dart';

class CRCoverSavedProvider extends ChangeNotifier {
  List<String> paths = [];

  savePath(String path) async {
    paths.add(path);
    notifyListeners();
  }
}
