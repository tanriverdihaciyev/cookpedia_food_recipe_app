import '../../extensions/context_ext.dart';
import '../../../features/get_started/presentation/pages/step_3/models/gs_dietory_prefs_model.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class DietoryPrefsCard extends StatelessWidget {
  const DietoryPrefsCard({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.dietoryPref,
  });
  final GSDietoryPrefsModel dietoryPref;
  final void Function() onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(
        Sizes.s1.toDouble(),
      ),
      child: ListTile(
        leading: Image.asset(
          dietoryPref.image,
          height: Sizes.s20.toDouble(),
        ),
        title: Text(
          dietoryPref.title,
          style: context.textTheme.titleSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
              Sizes.s15.toDouble(),
            ),
            right: Radius.circular(
              Sizes.s15.toDouble(),
            ),
          ),
          side:
              BorderSide(color: isSelected ? Colors.red : Colors.grey.shade800),
        ),
        onTap: onTap,
      ),
    );
  }
}
