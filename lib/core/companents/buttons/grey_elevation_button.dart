import 'package:flutter/material.dart';

import '../../extensions/context_ext.dart';
import '../../resources/sizes.dart';

class GreyElevationButton extends StatelessWidget {
  const GreyElevationButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width,
    this.height,
  });
  final void Function() onTap;
  final String text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? context.height(Sizes.s0_1),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
        ),
        child: Text(
          text,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
