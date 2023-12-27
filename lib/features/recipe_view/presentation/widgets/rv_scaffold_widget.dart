import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/recipe_view_provider.dart';
import '../widgets/rv_add_comment_widget.dart';
import '../widgets/rv_comments_text_icon_button_widget.dart';
import '../widgets/rv_comments_view_widget.dart';
import '../widgets/rv_cover_view_widget.dart';
import '../widgets/rv_recipe_user_tile_widget.dart';
import 'rv_content_title_row_widget.dart';
import 'rv_ingredients_view_widget.dart';
import 'rv_instructions_view_widget.dart';
import 'rv_more_recipes_like_this_widget.dart';

class RVScaffoldWidget extends StatelessWidget {
  const RVScaffoldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RecipeViewProvider recipeViewProvider = context.watch<RecipeViewProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: ListView(
        children: [
          const RVCoverViewWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              width: context.width(Sizes.s0_8),
              child: Text(
                recipeViewProvider.recipe.title,
                style: context.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const RVDividerWidget(),
          const RVRecipeUserTileWidget(),
          const RVDividerWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(recipeViewProvider.recipe.description),
          ),
          const RVContentTitleRowWidget(),
          const SizedBox(
            height: 10,
          ),
          const RVDividerWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Ingredients:",
              style: context.textTheme.headlineSmall,
            ),
          ),
          const RVIngredinetsViewWidget(),
          const SizedBox(
            height: 10,
          ),
          const RVDividerWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Instructions:",
              style: context.textTheme.headlineSmall,
            ),
          ),
          const RVInstructionsViewWidget(),
          const SizedBox(
            height: 10,
          ),
          const RVDividerWidget(),
          const RVCommentsTextAndIconButtonWidget(),
          const RVCommentsView(),
          const RVAddCommentWidget(),
          const SizedBox(
            height: 10,
          ),
          const RVDividerWidget(),
          const RVMoreRecipesLikeThisWidget(),
        ],
      ),
    );
  }
}

class RVDividerWidget extends StatelessWidget {
  const RVDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Divider(),
    );
  }
}
