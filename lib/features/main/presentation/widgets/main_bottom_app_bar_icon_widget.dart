import 'package:flutter/material.dart';

import '../../../../core/extensions/context_ext.dart';

class MainBottomAppBarIconWidget extends StatelessWidget {
  const MainBottomAppBarIconWidget({
    super.key,
    this.onPressed,
    required this.iconData,
    required this.label,
    required this.isSelectedPage,
  });
  final void Function()? onPressed;
  final IconData iconData;
  final String label;
  final bool isSelectedPage;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: isSelectedPage ? Colors.red : Colors.grey,
          ),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: isSelectedPage ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
