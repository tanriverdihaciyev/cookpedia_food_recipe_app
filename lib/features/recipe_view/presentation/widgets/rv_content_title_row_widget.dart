import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/recipe_view_provider.dart';

class RVContentTitleRowWidget extends StatelessWidget {
  const RVContentTitleRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RecipeViewProvider recipeViewProvider = context.watch<RecipeViewProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RVContentTitleWidget(
              iconData: Icons.timer_outlined,
              title: recipeViewProvider.recipe.cookTime,
              subTitle: "cook time"),
          RVContentTitleWidget(
              iconData: Icons.person_outline,
              title: recipeViewProvider.recipe.serves,
              subTitle: "serves"),
          RVContentTitleWidget(
              iconData: Icons.location_on_outlined,
              title: recipeViewProvider.recipe.origin,
              subTitle: "origin"),
        ],
      ),
    );
  }
}

class RVContentTitleWidget extends StatelessWidget {
  const RVContentTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconData,
  });
  final String title;
  final String subTitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Container(
        width: context.width(Sizes.s0_2_8),
        height: context.height(Sizes.s0_0_9),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  color: Colors.red,
                  size: Sizes.s15.toDouble(),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  title.substring(0, (title.length >= 10 ? 10 : title.length)),
                  style:
                      context.textTheme.labelLarge!.copyWith(color: Colors.red),
                ),
              ],
            ),
            Text(
              subTitle,
              style:
                  context.textTheme.labelMedium!.copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
