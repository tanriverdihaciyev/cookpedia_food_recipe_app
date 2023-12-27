import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
    required this.onChanged,
    required this.hint,
    this.suffixTap,
  });
  final void Function(String value) onChanged;
  final void Function()? suffixTap;
  final String hint;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  late FocusNode focusNode;
  bool onClick = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(
            Sizes.s15.toDouble(),
          ),
          right: Radius.circular(
            Sizes.s15.toDouble(),
          ),
        ),
      ),
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(
            prefixIcon:
                Icon(Icons.search, color: onClick ? Colors.white : Colors.grey),
            hintText: widget.hint,
            hintStyle: context.textTheme.titleSmall?.copyWith(
              color: onClick ? Colors.white : Colors.grey,
            ),
            suffixIcon: widget.suffixTap != null
                ? CloseButton(
                    onPressed: widget.suffixTap,
                  )
                : null),
        onTap: () {
          setState(() {
            onClick = true;
          });
        },
        onChanged: (value) {
          widget.onChanged(value);
          if (value == "") {
            setState(() {
              onClick = false;
            });
          }
        },
        onSubmitted: (value) {
          focusNode.unfocus();
          if (value == "") {
            setState(() {
              onClick = false;
            });
          }
        },
      ),
    );
  }
}
