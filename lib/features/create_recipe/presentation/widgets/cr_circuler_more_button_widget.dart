import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../states/cr_recipe_entity_provider.dart';

class CRCirculerMoreButtonWidget extends StatelessWidget {
  const CRCirculerMoreButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const Icon(
          Icons.more_horiz,
          size: 18,
        ),
      ),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(maxWidth: context.width(Sizes.s0_4)),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Are you sure you want to delete?",
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                await context
                                    .read<RecipeProvider>()
                                    .eitherIsRecipeExists(
                                        params: IsRecipeExistsParams(
                                            sharedUserId: context
                                                .read<UserProvider>()
                                                .user!
                                                .id,
                                            recipeId: context
                                                .read<CRRecipeEntityProvider>()
                                                .recipeEntity
                                                ?.id))
                                    .then((_) async {
                                  if (context
                                          .read<RecipeProvider>()
                                          .isRecipeExists !=
                                      null) {
                                    await context
                                        .read<RecipeProvider>()
                                        .eitherRemoveRecipeVoidOrFailure(
                                          params: RecipeParams(
                                              sharedUserId: context
                                                  .read<UserProvider>()
                                                  .user!
                                                  .id,
                                              recipeId: context
                                                  .read<
                                                      CRRecipeEntityProvider>()
                                                  .recipeEntity!
                                                  .id!),
                                        )
                                        .then((value) {
                                      // context
                                      //     .read<AppSnackBarProvider>()
                                      //     .saveSnackMessage("Deleting Recipe.");
                                      // context
                                      //     .read<AppSnackBarProvider>()
                                      //     .changeShowSnackBar();

                                      context.go(Routes.splashRoute);
                                    });
                                  } else if (context
                                          .read<RecipeProvider>()
                                          .isRecipeExistsFailure !=
                                      null) {
                                    // context
                                    //     .read<AppSnackBarProvider>()
                                    //     .saveSnackMessage(
                                    //         "Recipe not found or deleted");
                                    // context
                                    //     .read<AppSnackBarProvider>()
                                    //     .changeShowSnackBar();

                                    context.go(Routes.splashRoute);
                                  }
                                });
                              },
                              child: Text(
                                "Yes",
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Cancel",
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
                Text(
                  "Delete Recipe",
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
