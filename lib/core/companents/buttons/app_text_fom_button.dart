import '../../extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class AppTextFormButton extends StatelessWidget {
  const AppTextFormButton({
    super.key,
    this.width,
    this.obscureText,
    required this.hintText,
    this.textInputType,
    this.onSaved,
    this.validator,
    this.textEditingController,
    this.onTap,
    this.suffixIcon,
    this.label,
    this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.contentPadding,
    this.scrollPadding,
    this.enabled,
    this.isTextVisibility = true,
  });
  final TextEditingController? textEditingController;
  final void Function()? onTap;
  final double? width;
  final bool? obscureText;
  final String? label;
  final String hintText;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsets? scrollPadding;
  final bool? enabled;
  final bool? isTextVisibility;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTextVisibility!) Text(label ?? hintText),
        SizedBox(
          width: width ?? context.width(Sizes.s0_9),
          child: TextFormField(
            scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            textInputAction: textInputAction ?? TextInputAction.done,
            controller: textEditingController,
            obscureText: obscureText ?? false,
            onSaved: onSaved,
            validator: validator,
            onTap: onTap,
            onChanged: onChanged,
            focusNode: focusNode,
            mouseCursor: MouseCursor.uncontrolled,
            keyboardType: textInputType ?? TextInputType.name,
            decoration: InputDecoration(
              enabled: enabled ?? true,
              contentPadding: contentPadding,
              hintText: hintText,
              suffixIcon: suffixIcon,
              errorStyle: context.textTheme.labelMedium
                  ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
