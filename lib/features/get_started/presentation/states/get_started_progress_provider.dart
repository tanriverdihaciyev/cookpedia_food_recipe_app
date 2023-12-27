import 'package:flutter/material.dart';

import '../../../../core/resources/sizes.dart';
import 'get_started_step_provider.dart';

class GetStartedProgressProvider extends ChangeNotifier {
  double _progress = Sizes.s0_1_6;
  double get progress => _progress;

  incrementProgress(GetStartedStepProvider getStartedStepProvider) {
    if (getStartedStepProvider.step == 5) {
      _progress = _progress + Sizes.s0_2;
    } else {
      _progress = _progress + Sizes.s0_1_6;
    }
    notifyListeners();
  }

  decrementProgress(GetStartedStepProvider getStartedStepProvider) {
    if (getStartedStepProvider.step == 4) {
      _progress = _progress - Sizes.s0_2;
    } else {
      _progress = _progress - Sizes.s0_1_6;
    }
    notifyListeners();
  }

  resetProgress() {
    _progress = Sizes.s0_1_6;
    notifyListeners();
  }
}
