import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_ext.dart';

class CRInstructionTileLeadingWidget extends StatelessWidget {
  const CRInstructionTileLeadingWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.menu,
          size: 20,
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey.shade900,
          child: Text(
            "${index + 1}",
            style: context.textTheme.bodyMedium
                ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
