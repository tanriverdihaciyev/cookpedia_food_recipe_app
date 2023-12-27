import '../states/rv_cover_view_index_provider.dart';
import 'rv_custom_app_bar_widget.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/recipe_view_provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVCoverViewWidget extends StatelessWidget {
  const RVCoverViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RecipeViewProvider recipeViewProvider = context.watch<RecipeViewProvider>();

    int currentIndex = context.watch<RVCoverViewIndexProvider>().currentIndex;
    PageController pageController = PageController(initialPage: currentIndex);
    return SizedBox(
      height: context.height(Sizes.s0_4_5),
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) =>
                context.read<RVCoverViewIndexProvider>().changeIndex(value),
            itemCount: recipeViewProvider.recipe.coverImages.length,
            itemBuilder: (context, index) => SizedBox(
              width: context.width(),
              child: Image.network(
                recipeViewProvider.recipe.coverImages[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: context.width() / 2,
            child: DotsIndicator(
              dotsCount: recipeViewProvider.recipe.coverImages.length,
              position: currentIndex,
              onTap: (position) {
                context.read<RVCoverViewIndexProvider>().changeIndex(position);
                pageController.animateToPage(position,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              decorator: DotsDecorator(
                activeColor: Colors.red,
                color: Colors.grey.shade700,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          const RVCostomAppBarWidget()
        ],
      ),
    );
  }
}
