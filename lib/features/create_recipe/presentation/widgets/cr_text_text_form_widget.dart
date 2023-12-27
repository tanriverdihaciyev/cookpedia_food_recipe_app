import 'package:flutter/material.dart';

import '../../../../core/extensions/context_ext.dart';

class CRTextTextFormWidget extends StatelessWidget {
  const CRTextTextFormWidget({
    super.key,
    required this.label,
    required this.child,
  });
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: SizedBox(
              width: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
