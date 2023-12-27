import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class AppCheckBoxButton extends StatelessWidget {
  const AppCheckBoxButton({
    super.key,
    required this.value,
    this.onChanged,
    this.text,
  });
  final bool value;
  final void Function(bool?)? onChanged;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              isError: true,
              semanticLabel: "olmas",
              onChanged: onChanged,
              fillColor: const MaterialStatePropertyAll(Colors.red),
              checkColor: Colors.white,
            ),
            Text(
              text ?? "Remember me",
              style: context.textTheme.titleMedium,
            )
          ],
        ),
      ],
    );
  }
}
