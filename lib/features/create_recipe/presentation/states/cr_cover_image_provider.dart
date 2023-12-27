import 'dart:io';

import 'package:flutter/material.dart';

class CRCoverImageProvider extends ChangeNotifier {
  final List<File> _covers = [];
  List<File> get covers => _covers;

  bool isCover(int index) => index + 1 > _covers.length;

  void addCover(File image) {
    _covers.add(image);
    notifyListeners();
  }

  void removeCover(File image) {
    _covers.remove(image);
    notifyListeners();
  }

  void changeCover(File currentImage, File newImage) {
    int currentImageIndex = _covers.indexOf(currentImage);
    _covers[currentImageIndex] = newImage;
    notifyListeners();
  }
}
