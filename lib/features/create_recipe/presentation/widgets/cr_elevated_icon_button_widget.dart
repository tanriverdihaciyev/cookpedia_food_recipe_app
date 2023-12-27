import 'package:flutter/material.dart';

import '../../../../core/extensions/context_ext.dart';

class CRElevatedIconButtonWidget extends StatelessWidget {
  const CRElevatedIconButtonWidget({
    super.key,
    required this.onTap,
    required this.label,
  });
  final void Function() onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton.icon(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15)),
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800)),
        onPressed: onTap,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
