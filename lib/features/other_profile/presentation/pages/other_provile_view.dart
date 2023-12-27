import 'package:cookpedia_foodrecipe_app/core/companents/buttons/outline_red_icon_button.dart';
import 'package:cookpedia_foodrecipe_app/features/user_detail/presentation/states/user_detail_provider.dart';

import '../../../user/presentation/states/user_provider.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/follow_params.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/sizes.dart';
import '../../../follow/presentation/states/follow_provider.dart';
import '../widgets/op_about_view_widget.dart';
import '../widgets/op_recipes_view_widget.dart';
import '../../../profile/presentation/pages/profile_view.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherProfileView extends StatelessWidget {
  const OtherProfileView({super.key, required this.userEntity});
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    void follow() {
      context
          .read<FollowProvider>()
          .eitherFollowUserOrFailure(
            params: FollowParams(
                context.read<UserProvider>().user!.id, userEntity.id),
          )
          .then((value) {
        context.read<FollowProvider>().eitherIsFollowedOrFailure(
              params: FollowParams(
                  context.read<UserProvider>().user!.id, userEntity.id),
            );
        context.read<FollowProvider>().eitherOtherUserFollowersOrFailure(
            params: FollowUserParams(userID: userEntity.id));
        context.read<FollowProvider>().eitherUserFollowedOrFailure(
            params: FollowUserParams(
                userID: context.read<UserProvider>().user!.id));
      });
    }

    void unFollow() {
      context
          .read<FollowProvider>()
          .eitherUnFollowUserOrFailure(
            params: FollowParams(
                context.read<UserProvider>().user!.id, userEntity.id),
          )
          .then((value) {
        context.read<FollowProvider>().eitherIsFollowedOrFailure(
              params: FollowParams(
                  context.read<UserProvider>().user!.id, userEntity.id),
            );
        context.read<FollowProvider>().eitherOtherUserFollowersOrFailure(
            params: FollowUserParams(userID: userEntity.id));
        context.read<FollowProvider>().eitherUserFollowedOrFailure(
            params: FollowUserParams(
                userID: context.read<UserProvider>().user!.id));
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<RecipeProvider>().resetRecipes();
              context.read<UserDetailProvider>().resetOtherUser();
              context.read<FollowProvider>().resetAll();
              context.read<UserProvider>().resetOther();
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more),
          ),
        ],
      ),
      body: DefaultTabController(
        length: Sizes.s2,
        child: Padding(
          padding: context.paddingHorizMedium,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                titleSpacing: Sizes.s0.toDouble(),
                leadingWidth: Sizes.s0.toDouble(),
                floating: true,
                stretch: true,
                leading: const SizedBox(),
                toolbarHeight: context.height(Sizes.s0_3_5),
                title: Column(
                  children: [
                    ListTile(
                      leading: Image(
                          image: userEntity.profileImage != null
                              ? NetworkImage(userEntity.profileImage!)
                              : AssetImage(AssetsPaths.chef.imageToPath)
                                  as ImageProvider),
                      title: Text(userEntity.userName!),
                      subtitle: Text(userEntity.fullName!),
                      trailing: Builder(builder: (context) {
                        context
                            .read<FollowProvider>()
                            .eitherIsFollowedOrFailure(
                              params: FollowParams(
                                context.read<UserProvider>().user!.id,
                                userEntity.id,
                              ),
                            );
                        return Builder(builder: (context) {
                          bool isActiveUser = context
                              .watch<UserProvider>()
                              .isActiveUser(userEntity.id);
                          bool? isFollow =
                              context.watch<FollowProvider>().isFollowedUser;
                          Failure? failure =
                              context.watch<FollowProvider>().isFollowedFailure;
                          late Widget child;
                          if (isFollow != null) {
                            child = isActiveUser
                                ? const SizedBox()
                                : OutlinedRedIconButton(
                                    label: isFollow ? "UnFollow" : "Follow",
                                    onTap: isFollow ? unFollow : follow,
                                    // iconData: isFollow ? Icons.close : Icons.add
                                  );
                          } else if (failure != null) {
                            child = isActiveUser
                                ? const SizedBox()
                                : OutlinedRedIconButton(
                                    label: "Follow",
                                    onTap: follow,
                                  );
                          } else {
                            child = const SizedBox();
                          }
                          return child;
                        });
                      }),
                    ),
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
              ),
            ],
            body: TabBarView(
              children: [
                const OPRecipesViewWidget(),
                OPAboutViewWidget(userEntity: userEntity),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recipeLenghtWidget(BuildContext context) {
    context.read<RecipeProvider>().eitherOtherUserRecipesOrFailure(
          params: RecipeUserParams(sharedUserID: userEntity.id),
        );
    List<RecipeEntity>? recipes = context.watch<RecipeProvider>().otherRecipes;

    Failure? recipeLenghtFailure =
        context.watch<RecipeProvider>().otherRecipesFailure;

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
      context.read<RecipeProvider>().eitherOtherUserRecipesOrFailure(
          params: RecipeUserParams(sharedUserID: userEntity.id));
    }
    return recipeLengthWidget;
  }

  Widget _followedWidget(BuildContext context) {
    int? userFollowed = context.watch<FollowProvider>().otherUserFollowed;
    Failure? followedFailure =
        context.watch<FollowProvider>().otherUserFollowedFailure;
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
      context.read<FollowProvider>().eitherOtherUserFollowedOrFailure(
          params: FollowUserParams(userID: userEntity.id));
    }
    return followedWidget;
  }

  Widget _followersWidget(BuildContext context) {
    int? userFollowers = context.watch<FollowProvider>().otherUserFollowers;

    Failure? followersFailure =
        context.watch<FollowProvider>().otherUserFollowersFailure;
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
      context.read<FollowProvider>().eitherOtherUserFollowersOrFailure(
          params: FollowUserParams(userID: userEntity.id));
    }
    return followersWidget;
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
      ],
    );
  }
}
