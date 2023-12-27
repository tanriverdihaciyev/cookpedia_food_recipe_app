import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_ext.dart';
import '../../../../../core/resources/sizes.dart';

class CRInstructionTileTextFormWidget extends StatelessWidget {
  const CRInstructionTileTextFormWidget({
    super.key,
    required this.index,
    this.onSaved,
    this.validator,
  });

  final int index;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(Sizes.s0_8),
      child: Card(
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(hintText: "Instructions ${index + 1}"),
          maxLines: 3,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
