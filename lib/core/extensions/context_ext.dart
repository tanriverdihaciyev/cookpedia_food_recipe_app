import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  width([double value = 1]) => MediaQuery.of(this).size.width * value;
  height([double value = 1]) => MediaQuery.of(this).size.height * value;
}

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension NavigatorExt on BuildContext {
  goPage(String name) => Navigator.pushReplacementNamed(this, name);
  pop() => Navigator.pop(this);
  NavigatorState navigator() => Navigator.of(this);
}

extension AppPadding on BuildContext {
  get paddingAllLow => const EdgeInsets.all(10);
  get paddingAllMedium => const EdgeInsets.all(15);
  get paddingAllHigh => const EdgeInsets.all(20);
  get paddingHorizLow => const EdgeInsets.symmetric(horizontal: 10);
  get paddingHorizMedium => const EdgeInsets.symmetric(horizontal: 15);
  get paddingHorizHigh => const EdgeInsets.symmetric(horizontal: 20);
  get paddingVerticalLow => const EdgeInsets.symmetric(vertical: 10);
  get paddingVerticalMedium => const EdgeInsets.symmetric(vertical: 15);
  get paddingVerticalHigh => const EdgeInsets.symmetric(vertical: 20);
  get paddingTopLow => const EdgeInsets.only(top: 10);
  get paddingTopMedium => const EdgeInsets.only(top: 15);
  get paddingTopHigh => const EdgeInsets.only(top: 20);
  get paddingBottomLow => const EdgeInsets.only(bottom: 10);
  get paddingBottomMedium => const EdgeInsets.only(bottom: 15);
  get paddingBottomHigh => const EdgeInsets.only(left: 20);
  get paddingLeftLow => const EdgeInsets.only(left: 10);
  get paddingLeftMedium => const EdgeInsets.only(left: 15);
  get paddingLeftHigh => const EdgeInsets.only(left: 20);
  get paddingRightLow => const EdgeInsets.only(right: 10);
  get paddingRightMedium => const EdgeInsets.only(right: 15);
  get paddingRightHigh => const EdgeInsets.only(right: 20);
}
