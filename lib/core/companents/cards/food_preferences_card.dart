import '../../extensions/context_ext.dart';
import '../../../features/get_started/presentation/pages/step_2/models/gs_food_prefrence_model.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class FoodPreferencesCard extends StatelessWidget {
  const FoodPreferencesCard({
    super.key,
    required this.onTap,
    required this.foodPrefrence,
    required this.isSelected,
  });
  final GSFoodPrefrenceModel foodPrefrence;

  final void Function() onTap;

  final bool isSelected;
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
        side: BorderSide(color: isSelected ? Colors.red : Colors.grey.shade800),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(
            Sizes.s15.toDouble(),
          ),
          right: Radius.circular(
            Sizes.s15.toDouble(),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              foodPrefrence.image,
              height: Sizes.s20.toDouble(),
            ),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            Text(
              foodPrefrence.name,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
