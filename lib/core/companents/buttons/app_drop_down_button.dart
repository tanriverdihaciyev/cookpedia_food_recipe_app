import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  const AppDropDownButton({
    super.key,
    this.width,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    this.value,
  });
  final double? width;
  final String hintText;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final String? value;

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  String? selectValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText),
        DropdownButtonFormField(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.red,
          ),
          hint: Text(widget.hintText),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: widget.validator,
          onSaved: widget.onSaved,
          value: widget.value ?? selectValue,
          items: const [
            DropdownMenuItem(
              value: "Male",
              child: Text("Male"),
            ),
            DropdownMenuItem(
              value: "Female",
              child: Text("Female"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectValue = value;
            });
          },
        )
      ],
    );
  }
}
