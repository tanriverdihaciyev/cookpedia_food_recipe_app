import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/recipe_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVInstructionsViewWidget extends StatelessWidget {
  const RVInstructionsViewWidget({super.key});
  Widget viewImage(BuildContext context, String imageURL) {
    return Container(
      width: context.width(Sizes.s0_2_5),
      height: context.width(Sizes.s0_2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageURL),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RecipeViewProvider recipeViewProvider = context.watch<RecipeViewProvider>();

    List<Widget> instructions = [];
    for (int i = 0; i < recipeViewProvider.recipe.instructions.length; i++) {
      instructions.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: context.width(Sizes.s0_0_7) / 2,
            child: Text(
              "${i + 1}",
              style: context.textTheme.titleMedium!.copyWith(color: Colors.red),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: context.width(Sizes.s0_8),
                  child: Text(
                    recipeViewProvider.recipe.instructions[i].instruction,
                    style: context.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: context.width(Sizes.s0_8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      viewImage(context,
                          recipeViewProvider.recipe.instructions[i].image1),
                      viewImage(context,
                          recipeViewProvider.recipe.instructions[i].image2),
                      viewImage(context,
                          recipeViewProvider.recipe.instructions[i].image3),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: instructions,
      ),
    );
  }
}
