// ignore_for_file: use_build_context_synchronously

import 'package:cookpedia_foodrecipe_app/core/companents/buttons/outline_red_icon_button.dart';
import 'package:cookpedia_foodrecipe_app/core/params/recipe_params.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../states/cr_cook_time_provider.dart';
import '../states/cr_cover_saved_provider.dart';
import '../states/cr_description_provider.dart';
import '../states/cr_download_waiting_provider.dart';
import '../states/cr_form_key_provider.dart';
import '../states/cr_origin_provider.dart';
import '../states/cr_serves_provider.dart';
import '../states/cr_title_provider.dart';
import '../states/ingredients/cr_ingredients_provider.dart';
import '../states/instruction/cr_instruction_all_form_key_provider.dart';
import '../states/instruction/cr_instruction_entitys_provider.dart';
import 'cr_circuler_more_button_widget.dart';

class CRAppBarWidget extends StatelessWidget {
  const CRAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CloseButton(
        onPressed: () => context.go(Routes.splashRoute),
      ),
      title: const Text("Create"),
      titleSpacing: 0,
      actions: [
        RedElevationButton(
          onTap: () async {
            context
                .read<CRInstructionAllFieldFormKeyProvider>()
                .allValidateSave();

            if (context
                .read<CRFormKeyProvider>()
                .formKey
                .currentState!
                .validate()) {
              context.read<CRDownloadWaitingProvider>().changeDownload();

              context.read<CRFormKeyProvider>().formKey.currentState?.save();
              await Future.delayed(
                const Duration(seconds: 20),
              );
              var userID = context.read<UserProvider>().user!.id;
              var title = context.read<CRTitleProvider>().title!;
              var description =
                  context.read<CRDescriptionProvider>().description!;
              var cookTime = context.read<CRCookTimeProvider>().cookTime!;
              var serves = context.read<CRServesProvider>().serves!;
              var origin = context.read<CROriginProvider>().location!;
              var ingredients = context
                  .read<CRIngredientsProvider>()
                  .ingredients
                  .map((e) => e.ingredients)
                  .toList();
              var instructions =
                  context.read<CRInstructionEntitysProvider>().instructions;
              var covers = context.read<CRCoverSavedProvider>().paths;

              await context
                  .read<RecipeProvider>()
                  .eitherCreateRecipeVoidOrFailure(
                    params: RecipeEntity(
                        isPublishedRecipe: false,
                        sharedUserId: userID,
                        coverImages: covers,
                        title: title,
                        description: description,
                        cookTime: cookTime,
                        serves: serves,
                        origin: origin,
                        ingredients: ingredients,
                        instructions: instructions),
                  );
              context.read<CRDownloadWaitingProvider>().changeDownload();
              context.read<RecipeProvider>().eitherGetUserRecipesOrFailure(
                  params: RecipeUserParams(
                      sharedUserID: context.read<UserProvider>().user!.id));
              context.go(Routes.splashRoute);
            }
          },
          text: "Save",
          width: context.width(Sizes.s0_2_5),
          height: context.height(
            Sizes.s0_0_6,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OutlinedRedIconButton(
            label: "Puplish",
            onTap: () async {
              context
                  .read<CRInstructionAllFieldFormKeyProvider>()
                  .allValidateSave();

              if (context
                  .read<CRFormKeyProvider>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<CRDownloadWaitingProvider>().changeDownload();

                context.read<CRFormKeyProvider>().formKey.currentState?.save();
                await Future.delayed(
                  const Duration(seconds: 20),
                );
                var userID = context.read<UserProvider>().user!.id;
                var title = context.read<CRTitleProvider>().title!;
                var description =
                    context.read<CRDescriptionProvider>().description!;
                var cookTime = context.read<CRCookTimeProvider>().cookTime!;
                var serves = context.read<CRServesProvider>().serves!;
                var origin = context.read<CROriginProvider>().location!;
                var ingredients = context
                    .read<CRIngredientsProvider>()
                    .ingredients
                    .map((e) => e.ingredients)
                    .toList();
                var instructions =
                    context.read<CRInstructionEntitysProvider>().instructions;
                var covers = context.read<CRCoverSavedProvider>().paths;

                await context
                    .read<RecipeProvider>()
                    .eitherCreateRecipeVoidOrFailure(
                      params: RecipeEntity(
                          isPublishedRecipe: true,
                          sharedUserId: userID,
                          coverImages: covers,
                          title: title,
                          description: description,
                          cookTime: cookTime,
                          serves: serves,
                          origin: origin,
                          ingredients: ingredients,
                          instructions: instructions),
                    );
                context.read<CRDownloadWaitingProvider>().changeDownload();
                context.read<RecipeProvider>().eitherGetUserRecipesOrFailure(
                    params: RecipeUserParams(
                        sharedUserID: context.read<UserProvider>().user!.id));
                context.go(Routes.splashRoute);
              }
            },
            iconData: null),
        const SizedBox(
          width: 10,
        ),
        const CRCirculerMoreButtonWidget(),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
