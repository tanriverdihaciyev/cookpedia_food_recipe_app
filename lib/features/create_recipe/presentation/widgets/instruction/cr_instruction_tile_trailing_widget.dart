import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/instruction/cr_instruction_all_form_key_provider.dart';
import '../../states/instruction/cr_instruction_entitys_provider.dart';
import '../../states/instruction/cr_instruction_length_provider.dart';

class CRInstructionTileTrailingWidget extends StatelessWidget {
  const CRInstructionTileTrailingWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CRInstructionLenghtProvider>().decInstructionLenght();
        context.read<CRInstructionEntitysProvider>().removeInstruction(index);
        context.read<CRInstructionAllFieldFormKeyProvider>().removeKey();
      },
      child: const Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }
}
