import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/search_button.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../states/mr_search_provider.dart';

class MRAppBarWidget extends StatelessWidget {
  const MRAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MRSearchProvider mrSearchProvider = context.watch<MRSearchProvider>();
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().recipes;
    int? draftsLenght;
    int? puplishedLenght;
    if (recipes != null) {
      draftsLenght =
          recipes.where((element) => !element.isPublishedRecipe).length;
      puplishedLenght =
          recipes.where((element) => element.isPublishedRecipe).length;
    }
    return AppBar(
      leading: mrSearchProvider.isSearch
          ? null
          : const Icon(
              Icons.cookie,
              color: Colors.red,
            ),
      title: mrSearchProvider.isSearch
          ? SearchButton(
              hint: "search",
              onChanged: (text) => mrSearchProvider.setSearchContent(text),
              suffixTap: () {
                mrSearchProvider.setSearchContent(null);
                mrSearchProvider.changeSearch();
              },
            )
          : const Text("My Recipes"),
      actions: mrSearchProvider.isSearch
          ? null
          : [
              IconButton(
                onPressed: () {
                  mrSearchProvider.changeSearch();
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_outlined),
              ),
            ],
      bottom: TabBar(
        padding: context.paddingHorizMedium,
        indicatorColor: Colors.red,
        labelColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: context.textTheme.titleMedium,
        indicatorWeight: 5,
        onTap: (selectedTab) => mrSearchProvider.changeSelectedTab(selectedTab),
        tabs: [
          Tab(
            child: Text(
              "Draft (${draftsLenght ?? 0})",
            ),
          ),
          Tab(
            child: Text(
              "Puplished (${puplishedLenght ?? 0})",
            ),
          ),
        ],
      ),
    );
  }
}
