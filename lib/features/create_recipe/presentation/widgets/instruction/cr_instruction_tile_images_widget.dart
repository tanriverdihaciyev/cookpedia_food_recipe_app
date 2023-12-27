import 'dart:io';

import '../../../../../core/extensions/context_ext.dart';
import '../../../../../core/resources/sizes.dart';
import 'cr_instruction_image_form_widget.dart';
import 'package:flutter/material.dart';

class CRInstructionTileImagesWidget extends StatelessWidget {
  const CRInstructionTileImagesWidget({
    super.key,
    this.onSaved1,
    this.onSaved2,
    this.onSaved3,
    this.validator1,
    this.validator2,
    this.validator3,
  });

  final void Function(File?)? onSaved1;
  final void Function(File?)? onSaved2;
  final void Function(File?)? onSaved3;

  final String? Function(File?)? validator1;
  final String? Function(File?)? validator2;
  final String? Function(File?)? validator3;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(Sizes.s0_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CRInstructionImageFormWidget(
            onSaved: onSaved1,
            validator: validator1,
          ),
          CRInstructionImageFormWidget(
            onSaved: onSaved2,
            validator: validator2,
          ),
          CRInstructionImageFormWidget(
            onSaved: onSaved3,
            validator: validator3,
          ),
        ],
      ),
    );
  }
}
