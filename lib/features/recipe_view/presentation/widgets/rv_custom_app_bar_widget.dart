// ignore_for_file: use_build_context_synchronously

import 'package:go_router/go_router.dart';

import '../../../../core/params/saved_recipe_params.dart';
import '../states/recipe_view_provider.dart';
import '../../../saved_recipes/presentation/states/saved_recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import 'package:flutter/material.dart';

class RVCostomAppBarWidget extends StatelessWidget {
  const RVCostomAppBarWidget({super.key});
  bool isSharedUser(BuildContext context) {
    return context.watch<UserProvider>().user!.id ==
        context.watch<RecipeViewProvider>().recipe.sharedUserId;
  }

  @override
  Widget build(BuildContext context) {
    SavedRecipeProvider savedRecipeProvider =
        context.watch<SavedRecipeProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.go(Routes.splashRoute),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            isSharedUser(context)
                ? IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.change_circle,
                        color: Colors.white,
                      ),
                    ))
                : IconButton(
                    onPressed: () async {
                      if (savedRecipeProvider.isSavedRecipe != null) {
                        await savedRecipeProvider
                            .eitherUnSaveRecipe(
                          params: SavedRecipeParams(
                              userID: context.read<UserProvider>().user!.id,
                              recipeID: context
                                  .read<RecipeViewProvider>()
                                  .recipe
                                  .id!),
                        )
                            .then((value) async {
                          await savedRecipeProvider.eitherIsSavedRecipe(
                              params: SavedRecipeParams(
                                  userID: context.read<UserProvider>().user!.id,
                                  recipeID: context
                                      .read<RecipeViewProvider>()
                                      .recipe
                                      .id!));
                        });
                      } else {
                        await savedRecipeProvider
                            .eitherSaveRecipe(
                          params: SavedRecipeParams(
                              userID: context.read<UserProvider>().user!.id,
                              recipeID: context
                                  .read<RecipeViewProvider>()
                                  .recipe
                                  .id!),
                        )
                            .then((value) async {
                          await savedRecipeProvider.eitherIsSavedRecipe(
                              params: SavedRecipeParams(
                                  userID: context.read<UserProvider>().user!.id,
                                  recipeID: context
                                      .read<RecipeViewProvider>()
                                      .recipe
                                      .id!));
                        });
                      }
                      await savedRecipeProvider.eitherSaveRecipe(
                        params: SavedRecipeParams(
                            userID: context.read<UserProvider>().user!.id,
                            recipeID:
                                context.read<RecipeViewProvider>().recipe.id!),
                      );
                    },
                    icon: Icon(
                      savedRecipeProvider.isSavedRecipe != null
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: savedRecipeProvider.isSavedRecipe != null
                          ? Colors.red
                          : Colors.white,
                    ),
                  ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_outlined,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class RVAppBarWidget extends StatelessWidget {
  const RVAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => context.goPage(Routes.splashRoute),
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_outlined),
        ),
      ],
    );
  }
}
