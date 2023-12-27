import 'dart:io';

import 'package:flutter/material.dart';

class CRInstructionImageProvider extends ChangeNotifier {
  File? _image1;
  File? get image1 => _image1;
  File? _image2;
  File? get image2 => _image2;
  File? _image3;
  File? get image3 => _image3;

  saveImage1(File? image) {
    _image1 = image;
    notifyListeners();
  }

  saveImage2(File? image) {
    _image2 = image;
    notifyListeners();
  }

  saveImage3(File? image) {
    _image3 = image;
    notifyListeners();
  }

  bool get isNotEmpty => _image1 != null && _image2 != null && _image3 != null;
}
