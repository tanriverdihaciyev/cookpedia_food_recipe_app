import 'package:flutter/material.dart';

import '../../../../core/companents/buttons/app_text_fom_button.dart';

class EPTextFormFieldWidget extends StatefulWidget {
  const EPTextFormFieldWidget({
    super.key,
    this.validator,
    this.onSaved,
    required this.hintText,
    required this.value,
    this.maxLenght,
    this.maxLines,
    this.minLines,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  final String? value;
  final int? maxLenght;
  final int? maxLines;
  final int? minLines;

  @override
  State<EPTextFormFieldWidget> createState() => _EPTextFormFieldWidgetState();
}

class _EPTextFormFieldWidgetState extends State<EPTextFormFieldWidget> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AppTextFormButton(
          width: double.infinity,
          textEditingController: controller,
          maxLength: widget.maxLenght,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          hintText: widget.hintText,
          onSaved: widget.onSaved,
          validator: widget.validator,
        );
      },
    );
  }
}
