import 'package:cookpedia_foodrecipe_app/core/resources/sizes.dart';

import '../../../../core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/recipe_view_provider.dart';

class RVIngredinetsViewWidget extends StatelessWidget {
  const RVIngredinetsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeViewProvider recipeViewProvider = context.watch<RecipeViewProvider>();

    List<Widget> ingredients = [];
    for (int i = 0; i < recipeViewProvider.recipe.ingredients.length; i++) {
      ingredients.add(ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: context.width(Sizes.s0_0_7) / 2,
          child: Text(
            "${i + 1}",
            style: context.textTheme.titleMedium!.copyWith(color: Colors.red),
          ),
        ),
        title: Text(
          recipeViewProvider.recipe.ingredients[i],
          style: context.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: ingredients,
      ),
    );
  }
}
