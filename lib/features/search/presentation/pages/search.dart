import 'package:cookpedia_foodrecipe_app/core/companents/cards/recipe_card.dart';
import 'package:cookpedia_foodrecipe_app/core/errors/failures.dart';
import 'package:cookpedia_foodrecipe_app/core/params/follow_params.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/assets.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:cookpedia_foodrecipe_app/features/follow/presentation/states/follow_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/recipe/domain/entities/recipe_entity.dart';
import 'package:cookpedia_foodrecipe_app/features/recipe/presentation/states/recipe_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/search/presentation/states/search_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user/domain/entities/user_entity.dart';
import 'package:cookpedia_foodrecipe_app/features/user/presentation/states/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/outline_red_icon_button.dart';
import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/companents/buttons/search_button.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => SearchProvider(),
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height(Sizes.s0_1_6)),
            child: const SAppBarWidget()),
        body: const SBodyWidget(),
      ),
    );
  }
}

class SAppBarWidget extends StatelessWidget {
  const SAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = context.watch<SearchProvider>();
    return AppBar(
      leadingWidth: context.width(Sizes.s0_0_7),
      title: SearchButton(
          onChanged: (value) => searchProvider.setSearchText(value),
          hint: "Search for Recipes or Chef"),
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, context.height(Sizes.s0_1)),
          child: Padding(
            padding: context.paddingHorizMedium,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: searchProvider.isRecipes
                      ? RedElevationButton(
                          onTap: () => searchProvider.changeSearchBool(true),
                          text: "Recipes",
                          height: context.height(Sizes.s0_0_6),
                        )
                      : OutlinedRedIconButton(
                          label: "Recipes",
                          onTap: () => searchProvider.changeSearchBool(true),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: !searchProvider.isRecipes
                      ? RedElevationButton(
                          onTap: () => searchProvider.changeSearchBool(false),
                          text: "People",
                          height: context.height(Sizes.s0_0_6),
                        )
                      : OutlinedRedIconButton(
                          label: "People",
                          onTap: () => searchProvider.changeSearchBool(false),
                        ),
                )
              ],
            ),
          )),
    );
  }
}

class SBodyWidget extends StatelessWidget {
  const SBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = context.watch<SearchProvider>();
    List<RecipeEntity>? recipes =
        context.watch<RecipeProvider>().mostPopularRecipes;
    Failure? recipesFailure =
        context.watch<RecipeProvider>().mostPopularRecipesFailure;
    late Widget recipesChild;
    if (recipes != null && searchProvider.searchText != null) {
      var search = recipes
          .where(
            (element) =>
                element.title.contains(searchProvider.searchText!) ||
                element.description.contains(searchProvider.searchText!),
          )
          .toList();
      recipesChild = Padding(
        padding: context.paddingHorizLow,
        child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Sizes.s2,
              childAspectRatio: Sizes.s0_8,
            ),
            children: search.map((e) => RecipeCard(recipeEntity: e)).toList()),
      );
    } else if (recipesFailure != null) {
      recipesChild = Center(
        child: Text(recipesFailure.message),
      );
    } else {
      recipesChild = const SizedBox();
    }
    List<UserEntity>? users = context.watch<UserProvider>().topUsers;

    Failure? usersFailure = context.watch<UserProvider>().topUsersFailure;

    late Widget usersChild;
    if (users != null && searchProvider.searchText != null) {
      var search = users
          .where(
            (element) =>
                element.email.contains(searchProvider.searchText!) ||
                element.fullName!.contains(searchProvider.searchText!) ||
                element.userName!.contains(searchProvider.searchText!),
          )
          .toList();
      usersChild = Padding(
        padding: context.paddingHorizMedium,
        child: ListView(
          children: search
              .map(
                (e) => UserListTileCard(
                  e: e,
                ),
              )
              .toList(),
        ),
      );
    } else if (usersFailure != null) {
      usersChild = Center(
        child: Text(usersFailure.message),
      );
    } else {
      usersChild = const SizedBox();
    }
    return searchProvider.isRecipes ? recipesChild : usersChild;
  }
}

class UserListTileCard extends StatelessWidget {
  const UserListTileCard({
    super.key,
    required this.e,
  });
  final UserEntity e;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go(Routes.profileRoute, extra: e),
      leading: e.profileImage != null
          ? Image.network(e.profileImage!)
          : Image.asset(AssetsPaths.chef),
      title: Text(e.fullName ?? e.email),
      subtitle: Text(e.userName ?? e.email),
      trailing: SizedBox(
        width: context.width(Sizes.s0_2_7),
        height: context.height(Sizes.s0_0_5),
        child: ListenableProvider(
          create: (context) => FollowProvider()
            ..eitherIsFollowedOrFailure(
                params:
                    FollowParams(context.read<UserProvider>().user!.id, e.id)),
          child: Builder(
            builder: (context) {
              void follow() {
                context
                    .read<FollowProvider>()
                    .eitherFollowUserOrFailure(
                        params: FollowParams(
                            context.read<UserProvider>().user!.id, e.id))
                    .then((value) => context
                        .read<FollowProvider>()
                        .eitherIsFollowedOrFailure(
                            params: FollowParams(
                                context.read<UserProvider>().user!.id, e.id)));
              }

              void unFollow() {
                context
                    .read<FollowProvider>()
                    .eitherUnFollowUserOrFailure(
                        params: FollowParams(
                            context.read<UserProvider>().user!.id, e.id))
                    .then((value) => context
                        .read<FollowProvider>()
                        .eitherIsFollowedOrFailure(
                            params: FollowParams(
                                context.read<UserProvider>().user!.id, e.id)));
              }

              bool? isFollow = context.watch<FollowProvider>().isFollowedUser;
              Failure? failure =
                  context.watch<FollowProvider>().isFollowedFailure;
              late Widget child;
              if (isFollow != null) {
                child = isFollow
                    ? OutlinedRedIconButton(
                        label: "UnFollow",
                        onTap: () => unFollow(),
                      )
                    : RedElevationButton(onTap: () => follow(), text: "Follow");
              } else if (failure != null) {
                child =
                    RedElevationButton(onTap: () => follow(), text: "Follow");
              } else {
                child = const SizedBox();
              }
              return child;
            },
          ),
        ),
      ),
    );
  }
}
