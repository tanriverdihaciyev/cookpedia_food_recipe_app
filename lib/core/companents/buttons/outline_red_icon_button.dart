import '../../extensions/context_ext.dart';
import '../../resources/sizes.dart';
import 'package:flutter/material.dart';

class OutlinedRedIconButton extends StatelessWidget {
  const OutlinedRedIconButton({
    super.key,
    required this.label,
    required this.onTap,
    this.iconData,
  });
  final String label;
  final void Function()? onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
          side: MaterialStatePropertyAll(
              BorderSide(color: Colors.red, width: Sizes.s2.toDouble()))),
      onPressed: onTap,
      icon: iconData != null
          ? Icon(
              iconData,
              color: Colors.red,
            )
          : const SizedBox(),
      label: Text(
        label,
        style: context.textTheme.titleSmall?.copyWith(color: Colors.red),
      ),
    );
  }
}
