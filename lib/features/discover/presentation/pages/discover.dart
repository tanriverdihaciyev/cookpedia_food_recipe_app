import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/cards/recipe_card.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecipeProvider>().eitherGetMostPopularRecipesOrFailure();
    context.read<UserProvider>().eitherGetTopUsersOrFailure();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height(Sizes.s0_2)),
        child: const DAppBarWidget(),
      ),
      body: Padding(
        padding: context.paddingAllMedium,
        child: ListView(
          children: const [
            DMostPopularViewWidget(),
            // DTextForwardWidget(
            //   title: "Recipe Categories",
            //   onTap: () {},
            // ),
            DTopChefViewWidget(),
            DOurRecommendViewWidget(),
            DMostSearchesViewWidget(),
            DNewRecipesViewWidget(),
          ],
        ),
      ),
    );
  }
}

class DMostPopularViewWidget extends StatelessWidget {
  const DMostPopularViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? failure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget child;
    if (recipes != null && context.watch<UserProvider>().user != null) {
      recipes.retainWhere((element) =>
          element.sharedUserId != context.watch<UserProvider>().user!.id);
      recipes.sort(
        (a, b) => a.view!.compareTo(b.view!),
      );
      if (recipes.isNotEmpty) {
        child = Column(
          children: [
            DTextForwardWidget(
              title: "Most Popular",
              onTap: () => context.go(Routes.mostPopularRoute),
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recipes.map(
                    (e) {
                      return RecipeCard(recipeEntity: e);
                    },
                  ).toList()),
            ),
          ],
        );
      } else {
        child = const SizedBox();
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

class DTopChefViewWidget extends StatelessWidget {
  const DTopChefViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<UserEntity>? chefs = context.watch<UserProvider>().topUsers;
    Failure? failure = context.watch<UserProvider>().topUsersFailure;
    late Widget child;
    if (chefs != null && context.watch<UserProvider>().user != null) {
      chefs.retainWhere(
          (element) => element.id != context.watch<UserProvider>().user!.id);
      chefs.sort(
        (a, b) => a.view!.compareTo(b.view!),
      );
      if (chefs.isNotEmpty) {
        child = Column(
          children: [
            DTextForwardWidget(
              title: "Top Chefs",
              onTap: () => context.go(Routes.topChefsRoute),
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: chefs
                    .map(
                      (e) => ChefCard(
                        userEntity: e,
                        width: context.width(Sizes.s0_3_5),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      } else {
        child = const SizedBox();
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

class DOurRecommendViewWidget extends StatelessWidget {
  const DOurRecommendViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? failure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget child;
    if (recipes != null && context.watch<UserProvider>().user != null) {
      recipes.retainWhere((element) =>
          element.sharedUserId != context.watch<UserProvider>().user!.id);
      recipes.sort(
        (a, b) => a.view!.compareTo(b.view!),
      );
      if (recipes.isNotEmpty) {
        child = Column(
          children: [
            DTextForwardWidget(
              title: "Our Recommendations",
              onTap: () => context.go(Routes.ourRecommendRoute),
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recipes.map((e) {
                    return RecipeCard(recipeEntity: e);
                  }).toList()),
            ),
          ],
        );
      } else {
        child = const SizedBox();
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

class DMostSearchesViewWidget extends StatelessWidget {
  const DMostSearchesViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? failure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget child;
    if (recipes != null && context.watch<UserProvider>().user != null) {
      recipes.retainWhere((element) =>
          element.sharedUserId != context.watch<UserProvider>().user!.id);
      recipes.sort(
        (a, b) => a.view!.compareTo(b.view!),
      );

      if (recipes.isNotEmpty) {
        child = Column(
          children: [
            DTextForwardWidget(
              title: "Most Searches",
              onTap: () => context.go(Routes.mostSearchesRoute),
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recipes.map((e) {
                  return RecipeCard(recipeEntity: e);
                }).toList(),
              ),
            ),
          ],
        );
      } else {
        child = const SizedBox();
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

class DNewRecipesViewWidget extends StatelessWidget {
  const DNewRecipesViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? failure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget child;
    if (recipes != null && context.watch<UserProvider>().user != null) {
      recipes.retainWhere((element) =>
          element.sharedUserId != context.watch<UserProvider>().user!.id);
      recipes.sort(
        (b, a) => a.createdDate!.compareTo(b.createdDate!),
      );
      if (recipes.isNotEmpty) {
        child = Column(
          children: [
            DTextForwardWidget(
              title: "New Recipes",
              onTap: () => context.go(Routes.newRecipesRoute),
            ),
            SizedBox(
              height: context.height(Sizes.s0_3),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recipes.map((e) {
                    return RecipeCard(recipeEntity: e);
                  }).toList()),
            ),
          ],
        );
      } else {
        child = const SizedBox();
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

class DTextForwardWidget extends StatelessWidget {
  const DTextForwardWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class DAppBarWidget extends StatelessWidget {
  const DAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.cookie,
        color: Colors.red,
      ),
      title: const Text("Discover"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_outlined))
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, context.height(Sizes.s0_1)),
        child: Padding(
          padding: context.paddingHorizMedium,
          child: Card(
              child: ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Search for Recipes or Chef"),
            onTap: () => context.go(Routes.searchRoute),
          )),
        ),
      ),
    );
  }
}
