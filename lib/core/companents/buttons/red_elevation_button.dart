import 'package:flutter/material.dart';

import '../../extensions/context_ext.dart';
import '../../resources/sizes.dart';

class RedElevationButton extends StatelessWidget {
  const RedElevationButton({
    super.key,
    required this.onTap,
    this.width,
    this.height,
    required this.text,
  });
  final void Function() onTap;
  final String text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? context.height(Sizes.s0_0_8),
      child: ElevatedButton(
        onPressed: onTap,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red),
        ),
        child: Text(
          text,
          style: context.textTheme.titleSmall,
        ),
      ),
    );
  }
}
