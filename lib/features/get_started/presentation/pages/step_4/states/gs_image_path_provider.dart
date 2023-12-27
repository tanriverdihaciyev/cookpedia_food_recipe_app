import 'dart:io';

import 'package:flutter/material.dart';

class GSImagePathProvider extends ChangeNotifier {
  File? _imagePath;
  File? get imagePath => _imagePath;

  addImage(File image) {
    _imagePath = image;
    notifyListeners();
  }

  removeImage() {
    _imagePath == null;
    notifyListeners();
  }
}
