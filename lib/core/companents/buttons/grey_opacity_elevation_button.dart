import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/sizes.dart';
import 'package:flutter/material.dart';

class GreyOpacityElevationButton extends StatelessWidget {
  const GreyOpacityElevationButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    this.borderSide,
    this.text,
    required this.iconData,
    this.iconColor,
  });
  final double? width;
  final double? height;
  final void Function() onPressed;
  final BorderSide? borderSide;
  final String? text;
  final IconData iconData;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? context.height(Sizes.s0_0_8),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.grey.shade900,
            ),
            side: MaterialStatePropertyAll(
              borderSide ?? BorderSide.none,
            )),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            text != null
                ? SizedBox(
                    width: Sizes.s10.toDouble(),
                  )
                : const SizedBox(),
            text != null
                ? Text(
                    text!,
                    style: context.textTheme.bodyLarge,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
