import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_ext.dart';

class CRTitleLargeWidget extends StatelessWidget {
  const CRTitleLargeWidget({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.textTheme.titleLarge,
    );
  }
}
