import '../../extensions/context_ext.dart';
import '../../../features/get_started/presentation/pages/step_1/models/cooking_level_model.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class CookingLevelCard extends StatelessWidget {
  const CookingLevelCard({
    super.key,
    required this.cookingLevel,
    required this.onTap,
    required this.index,
    this.selectedIndex,
  });
  final GSCookingLevelModel cookingLevel;
  final void Function() onTap;
  final int index;
  final int? selectedIndex;

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
          side: BorderSide(
              color:
                  selectedIndex == index ? Colors.red : Colors.grey.shade800)),
      child: ListTile(
        title: Text(
          cookingLevel.title,
          style: context.textTheme.titleLarge,
        ),
        subtitle: Text(
          cookingLevel.describtion,
          style: context.textTheme.bodyLarge,
        ),
        onTap: onTap,
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
      ),
    );
  }
}
