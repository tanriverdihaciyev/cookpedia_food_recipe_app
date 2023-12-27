import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/cards/recipe_card.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';

class OPRecipesViewWidget extends StatelessWidget {
  const OPRecipesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().otherRecipes;
    Failure? recipeFailure =
        context.watch<RecipeProvider>().otherRecipesFailure;

    late Widget recipesView;
    if (recipes != null) {
      List<RecipeEntity> puplished = recipes
          .where((element) => element.isPublishedRecipe == true)
          .toList();
      recipesView = GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Sizes.s2,
          childAspectRatio: Sizes.s0_8,
        ),
        children: puplished.map((e) => RecipeCard(recipeEntity: e)).toList(),
      );
    } else if (recipeFailure != null) {
      recipesView = const Center(
        child: Text("No Recipe"),
      );
    } else {
      recipesView = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return recipesView;
  }
}
