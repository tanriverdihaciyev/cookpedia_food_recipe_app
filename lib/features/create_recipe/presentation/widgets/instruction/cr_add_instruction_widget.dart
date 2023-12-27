import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/instruction/cr_instruction_all_form_key_provider.dart';
import '../../states/instruction/cr_instruction_length_provider.dart';
import '../cr_elevated_icon_button_widget.dart';

class CRAddInstructionWidget extends StatelessWidget {
  const CRAddInstructionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CRElevatedIconButtonWidget(
      onTap: () {
        context.read<CRInstructionLenghtProvider>().incInstructionLenght();
        context.read<CRInstructionAllFieldFormKeyProvider>().addKey();
      },
      label: "Add Instructions:",
    );
  }
}
