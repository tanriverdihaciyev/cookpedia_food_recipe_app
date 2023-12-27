import '../../../../core/companents/cards/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../states/mr_search_provider.dart';

class MRBodyWidget extends StatelessWidget {
  const MRBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MRSearchProvider mrSearchProvider = context.watch<MRSearchProvider>();
    return Padding(
      padding: context.paddingAllMedium,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          mrSearchProvider.isSearch && mrSearchProvider.selectedTab == 0
              ? const MRSearchBodyWidget()
              : const MRDraftViewWidget(),
          mrSearchProvider.isSearch && mrSearchProvider.selectedTab == 1
              ? const MRSearchBodyWidget()
              : const MRPuplishedViewWidget(),
        ],
      ),
    );
  }
}

class MRSearchBodyWidget extends StatelessWidget {
  const MRSearchBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MRSearchProvider mrSearchProvider = context.watch<MRSearchProvider>();
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().recipes;
    Failure? failure = context.watch<RecipeProvider>().recipesFailure;
    late Widget child;
    if (recipes != null) {
      if (mrSearchProvider.selectedTab == 0) {
        List<RecipeEntity> drafts =
            recipes.where((element) => !element.isPublishedRecipe).toList();
        List<RecipeEntity> searchResult = drafts
            .where((element) =>
                element.title.contains(mrSearchProvider.searchContent ?? ""))
            .toList();
        child = GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Sizes.s2,
              childAspectRatio: Sizes.s0_8,
            ),
            children:
                searchResult.map((e) => RecipeCard(recipeEntity: e)).toList());
      } else {
        List<RecipeEntity> puplisheds =
            recipes.where((element) => element.isPublishedRecipe).toList();
        List<RecipeEntity> searchResult = puplisheds
            .where((element) =>
                element.title.contains(mrSearchProvider.searchContent ?? ""))
            .toList();
        child = GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Sizes.s2,
              childAspectRatio: Sizes.s0_8,
            ),
            children:
                searchResult.map((e) => RecipeCard(recipeEntity: e)).toList());
      }
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

class MRDraftViewWidget extends StatelessWidget {
  const MRDraftViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().recipes;

    Failure? failure = context.watch<RecipeProvider>().recipesFailure;
    late Widget child;
    if (recipes != null) {
      List<RecipeEntity> drafts =
          recipes.where((element) => !element.isPublishedRecipe).toList();
      child = GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Sizes.s2,
            childAspectRatio: Sizes.s0_8,
          ),
          children: drafts.map((e) => RecipeCard(recipeEntity: e)).toList());
    } else if (failure != null) {
      child = const Text("Error");
    } else {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return child;
  }
}

class MRPuplishedViewWidget extends StatelessWidget {
  const MRPuplishedViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().recipes;

    Failure? failure = context.watch<RecipeProvider>().recipesFailure;
    late Widget child;
    if (recipes != null) {
      List<RecipeEntity> puplisheds =
          recipes.where((element) => element.isPublishedRecipe).toList();
      child = GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Sizes.s2,
            childAspectRatio: Sizes.s0_8,
          ),
          children:
              puplisheds.map((e) => RecipeCard(recipeEntity: e)).toList());
    } else if (failure != null) {
      child = const Text("Error");
    } else {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return child;
  }
}
