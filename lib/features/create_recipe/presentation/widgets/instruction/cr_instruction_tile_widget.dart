import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';

import 'cr_instruction_tile_leading_widget.dart';
import 'cr_instruction_tile_trailing_widget.dart';
import 'package:flutter/material.dart';
import 'cr_instruction_all_field_form_widget.dart';

class CRInstructionTileWidget extends StatefulWidget {
  const CRInstructionTileWidget({
    super.key,
    required this.index,
    required this.formKey,
  });
  final int index;
  final GlobalKey<FormState> formKey;
  @override
  State<CRInstructionTileWidget> createState() =>
      _CRInstructionTileWidgetState();
}

class _CRInstructionTileWidgetState extends State<CRInstructionTileWidget>
    with AutomaticKeepAliveClientMixin<CRInstructionTileWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: context.paddingHorizLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CRInstructionTileLeadingWidget(index: widget.index),
          CRInstructionAllFieldFormWidget(
              index: widget.index, formKey: widget.formKey),
          Expanded(child: CRInstructionTileTrailingWidget(index: widget.index)),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
