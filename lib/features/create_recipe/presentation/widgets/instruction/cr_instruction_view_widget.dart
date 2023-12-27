import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/instruction/cr_instruction_all_form_key_provider.dart';
import '../../states/instruction/cr_instruction_length_provider.dart';
import '../cr_sized_box_10.dart';
import 'cr_instruction_tile_widget.dart';

class CRInstructionViewWidget extends StatefulWidget {
  const CRInstructionViewWidget({super.key});

  @override
  State<CRInstructionViewWidget> createState() =>
      _CRInstructionViewWidgetState();
}

class _CRInstructionViewWidgetState extends State<CRInstructionViewWidget>
    with AutomaticKeepAliveClientMixin<CRInstructionViewWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> instructions = [];
    for (var i = 0;
        i < context.watch<CRInstructionLenghtProvider>().instructionLenght;
        i++) {
      instructions.add(Column(
        children: [
          CRInstructionTileWidget(
              index: i,
              formKey: context
                  .read<CRInstructionAllFieldFormKeyProvider>()
                  .forms[i]),
          const CRSizedBox10(),
        ],
      ));
    }
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: instructions,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
