import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/cards/recipe_card.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../discover/presentation/pages/discover.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../saved_recipes/domain/entities/saved_recipe_enitity.dart';
import '../../../saved_recipes/presentation/states/saved_recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<UserProvider>().user != null) {
      context.read<RecipeProvider>().eitherGetRecentRecipesOrFailure(
            params: RecentRecipeParams(
                userID: context.read<UserProvider>().user!.id),
          );

      List<SavedRecipeEntity>? savedRecipes =
          context.watch<SavedRecipeProvider>().savedRecipes;
      Failure? failure =
          context.watch<SavedRecipeProvider>().savedRecipesFailure;
      if (savedRecipes != null) {
        context.read<RecipeProvider>().eitherGetSavedRecipesOrFailure(
              params: context.read<SavedRecipeProvider>().savedRecipes!,
            );
      } else if (failure != null) {
      } else {
        context.read<SavedRecipeProvider>().eitherGetSavedRecipes(
              params: GetSaveRecipesParams(
                  userID: context.read<UserProvider>().user!.id),
            );
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.cookie,
          color: Colors.red,
        ),
        title: const Text("Cookpedia"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_outline),
          ),
        ],
      ),
      body: const HBodyWidget(),
    );
  }
}

class HBodyWidget extends StatelessWidget {
  const HBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [HRecentRecipesWidget(), HSavedRecipesWidget()],
    );
  }
}

class HRecentRecipesWidget extends StatelessWidget {
  const HRecentRecipesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recentRecipes =
        context.watch<RecipeProvider>().recentRecipes;
    Failure? failure = context.watch<RecipeProvider>().recentRecipesFailure;
    late Widget child;
    if (recentRecipes != null &&
        recentRecipes.isNotEmpty &&
        context.read<UserProvider>().user != null) {
      recentRecipes.retainWhere((element) =>
          element.sharedUserId != context.read<UserProvider>().user!.id);
      child = Padding(
        padding: context.paddingHorizMedium,
        child: Column(
          children: [
            DTextForwardWidget(
              title: "Recent Recipes",
              onTap: () {},
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recentRecipes.map((e) {
                    return RecipeCard(recipeEntity: e);
                  }).toList()),
            ),
          ],
        ),
      );
    } else if (failure != null) {
      child = const SizedBox();
    } else {
      child = const SizedBox();
    }
    return child;
  }
}

class HSavedRecipesWidget extends StatelessWidget {
  const HSavedRecipesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? savedRecipes =
        context.watch<RecipeProvider>().savedRecipes;
    Failure? failure = context.watch<RecipeProvider>().savedRecipesFailure;
    late Widget child;
    if (savedRecipes != null) {
      savedRecipes.retainWhere((element) =>
          element.sharedUserId != context.read<UserProvider>().user!.id);
      child = Padding(
        padding: context.paddingHorizMedium,
        child: Column(
          children: [
            DTextForwardWidget(
              title: "Your Bookmark",
              onTap: () {},
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: savedRecipes.map((e) {
                    return RecipeCard(recipeEntity: e);
                  }).toList()),
            ),
          ],
        ),
      );
    } else if (failure != null) {
      child = const SizedBox();
    } else {
      child = const SizedBox();
    }
    return child;
  }
}
