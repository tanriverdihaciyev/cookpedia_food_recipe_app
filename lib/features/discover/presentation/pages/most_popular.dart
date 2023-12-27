import '../../../../core/companents/cards/recipe_card.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostPopularView extends StatelessWidget {
  const MostPopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Most Popular"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: context.paddingAllMedium,
          child: const MPBodyWidget(),
        ));
  }
}

class MPBodyWidget extends StatelessWidget {
  const MPBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? failure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget child;
    if (recipes != null) {
      child = GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Sizes.s2,
            childAspectRatio: Sizes.s0_8,
          ),
          children: recipes.map((e) => RecipeCard(recipeEntity: e)).toList());
    } else if (failure != null) {
      child = const SizedBox();
    } else {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return child;
  }
}
