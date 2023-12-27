import 'package:cookpedia_foodrecipe_app/core/companents/buttons/outline_red_icon_button.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/resources/routes.dart';
import '../../../auth/presentation/states/auth_provider.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/sizes.dart';
import '../../../follow/presentation/states/follow_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../pages/profile_view.dart';

class ProfileBodySliverAppBarWidget extends StatelessWidget {
  const ProfileBodySliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: Sizes.s0.toDouble(),
      leadingWidth: Sizes.s0.toDouble(),
      floating: true,
      stretch: true,
      leading: const SizedBox(),
      toolbarHeight: context.height(Sizes.s0_3_5),
      title: Column(
        children: [
          _userWidget(context),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _recipeLenghtWidget(context),
              IntrinsicHeight(
                child: SizedBox(
                  height: context.height(Sizes.s0_0_5),
                  child: const VerticalDivider(),
                ),
              ),
              _followersWidget(context),
              IntrinsicHeight(
                child: SizedBox(
                  height: context.height(Sizes.s0_0_5),
                  child: const VerticalDivider(),
                ),
              ),
              _followedWidget(context),
            ],
          ),
          const Divider(),
          _tabbar()
        ],
      ),
    );
  }

  TabBar _tabbar() {
    return const TabBar(
        labelColor: Colors.red,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            child: Text(
              "Recipes",
            ),
          ),
          Tab(
            child: Text("About"),
          ),
        ]);
  }

  Widget _userWidget(BuildContext context) {
    UserEntity? user = context.watch<UserProvider>().user;
    Failure? failure = context.watch<UserProvider>().failure;
    late Widget userListTile;

    if (user != null) {
      userListTile = ListTile(
        leading: Image(
            image: user.profileImage != null
                ? NetworkImage(user.profileImage!)
                : AssetImage(AssetsPaths.chef.imageToPath) as ImageProvider),
        title: Text(user.userName!),
        subtitle: Text(user.fullName!),
        trailing: OutlinedRedIconButton(
            label: "Edit",
            onTap: () {
              context.go(Routes.editProfileRoute);
            },
            iconData: Icons.edit),
      );
    } else if (failure != null) {
      userListTile = Center(
        child: Text(failure.message),
      );
    } else {
      userListTile = const Center(
        child: CircularProgressIndicator(),
      );
      if (context.read<AuthProvider>().auth != null) {
        context.read<UserProvider>().eitherGetUserOrFailure(
              params: UserParams(id: context.read<AuthProvider>().auth!.id),
              userDetailProvider: context.read<UserDetailProvider>(),
              recipeProvider: context.read<RecipeProvider>(),
            );
      }
    }
    return userListTile;
  }

  Widget _followedWidget(BuildContext context) {
    int? userFollowed = context.watch<FollowProvider>().userFollowed;
    Failure? followedFailure = context.watch<FollowProvider>().followedFailure;
    late Widget followedWidget;
    if (userFollowed != null) {
      followedWidget = CounterTitle(
        title: "follow",
        counter: userFollowed.toString(),
      );
    } else if (followedFailure != null) {
      followedWidget = const CounterTitle(title: "follow", counter: "0");
    } else {
      followedWidget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return followedWidget;
  }

  Widget _followersWidget(BuildContext context) {
    int? userFollowers = context.watch<FollowProvider>().userFollowers;

    Failure? followersFailure =
        context.watch<FollowProvider>().followersFailure;
    late Widget followersWidget;

    if (userFollowers != null) {
      followersWidget = CounterTitle(
        title: "followers",
        counter: userFollowers.toString(),
      );
    } else if (followersFailure != null) {
      followersWidget = const CounterTitle(title: "followers", counter: "0");
    } else {
      followersWidget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return followersWidget;
  }

  Widget _recipeLenghtWidget(BuildContext context) {
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().recipes;

    Failure? recipeLenghtFailure =
        context.watch<RecipeProvider>().recipesFailure;

    late Widget recipeLengthWidget;
    if (recipes != null) {
      int lenght = recipes.where((element) => element.isPublishedRecipe).length;
      recipeLengthWidget = CounterTitle(
        title: "recipes",
        counter: lenght.toString(),
      );
    } else if (recipeLenghtFailure != null) {
      recipeLengthWidget = const CounterTitle(
        title: "recipes",
        counter: "0",
      );
    } else {
      recipeLengthWidget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return recipeLengthWidget;
  }
}
