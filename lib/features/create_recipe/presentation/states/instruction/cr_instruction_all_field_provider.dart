import 'dart:io';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CRInsturctionAllFieldParams {
  int? index;
  String? instruction;
  File? image1;
  File? image2;
  File? image3;
  CRInsturctionAllFieldParams(
      {this.instruction, this.image1, this.image2, this.image3, this.index});

  CRInsturctionAllFieldParams copyWith(
      {String? instruction,
      File? image1,
      File? image2,
      File? image3,
      int? index}) {
    return CRInsturctionAllFieldParams(
      index: index ?? this.index,
      instruction: instruction ?? this.instruction,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
    );
  }
}

class CRInstructionAllFieldProvider extends ChangeNotifier {
  List<CRInsturctionAllFieldParams> params = [];

  CRInsturctionAllFieldParams? getParams(int index) {
    CRInsturctionAllFieldParams? searchElement;
    for (var element in params) {
      if (element.index == index) {
        searchElement = element;
      }
    }
    return searchElement;
  }

  saveInstruct(String? instruct, int index) {
    if (params.isNotEmpty) {
      var param = params.firstWhereOrNull((element) => element.index == index);
      if (param != null) {
        int currentParam = params.indexOf(param);
        params[currentParam] = param.copyWith(instruction: instruct);
        notifyListeners();
      } else {
        params.add(
            CRInsturctionAllFieldParams(index: index, instruction: instruct));
        notifyListeners();
      }
    } else {
      params.add(
          CRInsturctionAllFieldParams(index: index, instruction: instruct));
      notifyListeners();
    }
  }

  saveImage1(File? image, int index) {
    if (params.isNotEmpty) {
      var param = params.firstWhereOrNull((element) => element.index == index);
      if (param != null) {
        int currentParam = params.indexOf(param);
        params[currentParam] = param.copyWith(image1: image);
        notifyListeners();
      } else {
        params.add(CRInsturctionAllFieldParams(index: index, image1: image));
        notifyListeners();
      }
    } else {
      params.add(CRInsturctionAllFieldParams(index: index, image1: image));
      notifyListeners();
    }
  }

  saveImage2(File? image, int index) {
    if (params.isNotEmpty) {
      var param = params.firstWhereOrNull((element) => element.index == index);
      if (param != null) {
        int currentParam = params.indexOf(param);
        params[currentParam] = param.copyWith(image2: image);
        notifyListeners();
      } else {
        params.add(CRInsturctionAllFieldParams(index: index, image2: image));
        notifyListeners();
      }
    } else {
      params.add(CRInsturctionAllFieldParams(index: index, image2: image));
      notifyListeners();
    }
  }

  saveImage3(File? image, int index) {
    if (params.isNotEmpty) {
      var param = params.firstWhereOrNull((element) => element.index == index);
      if (param != null) {
        int currentParam = params.indexOf(param);
        params[currentParam] = param.copyWith(image3: image);
        notifyListeners();
      } else {
        params.add(CRInsturctionAllFieldParams(index: index, image3: image));
        notifyListeners();
      }
    } else {
      params.add(CRInsturctionAllFieldParams(index: index, image3: image));
      notifyListeners();
    }
  }
}
