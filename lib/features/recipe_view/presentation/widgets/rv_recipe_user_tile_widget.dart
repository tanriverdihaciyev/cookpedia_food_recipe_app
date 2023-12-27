import 'package:cookpedia_foodrecipe_app/core/params/follow_params.dart';
import 'package:cookpedia_foodrecipe_app/core/params/user_detail_params.dart';
import 'package:cookpedia_foodrecipe_app/core/params/user_params.dart';
import 'package:cookpedia_foodrecipe_app/core/params/user_visit_params.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:cookpedia_foodrecipe_app/features/follow/presentation/states/follow_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user_detail/presentation/states/user_detail_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user_visit/presentation/states/user_visit_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVRecipeUserTileWidget extends StatelessWidget {
  const RVRecipeUserTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity? recipeUser = context.watch<UserProvider>().recipeUser;
    Failure? recipeUserFailure =
        context.watch<UserProvider>().recipeUserFailure;
    late Widget userListTile;
    if (recipeUser != null) {
      bool isActiveUser =
          context.watch<UserProvider>().isActiveUser(recipeUser.id);
      userListTile = Builder(builder: (context) {
        context.read<FollowProvider>().eitherIsFollowedOrFailure(
            params: FollowParams(
                context.read<UserProvider>().user!.id, recipeUser.id));
        return ListTile(
          onTap: () {
            context.read<UserProvider>().eitherGetOtherUserOrFailure(
                  params: UserParams(id: recipeUser.id),
                );

            context.read<UserVisitProvider>().eitherAddUserVisit(
                  params: UserVisitParams(
                      activeUserId: context.read<UserProvider>().user!.id,
                      visitUserId: recipeUser.id),
                );
            context
                .read<UserDetailProvider>()
                .eitherGetOtherUserDetailVoidOrFailure(
                    params: UserDetailParams(id: recipeUser.id));
            context.go(Routes.profileRoute, extra: recipeUser);
          },
          contentPadding: context.paddingRightMedium,
          leading: CircleAvatar(
            radius: context.width(Sizes.s0_1),
            backgroundImage: NetworkImage(recipeUser.profileImage!),
          ),
          title: Text(
            recipeUser.fullName!,
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text("#${recipeUser.email}"),
          trailing: isActiveUser
              ? null
              : Builder(builder: (context) {
                  void follow() {
                    context
                        .read<FollowProvider>()
                        .eitherFollowUserOrFailure(
                          params: FollowParams(
                              context.read<UserProvider>().user!.id,
                              recipeUser.id),
                        )
                        .then((value) {
                      context.read<FollowProvider>().eitherIsFollowedOrFailure(
                            params: FollowParams(
                                context.read<UserProvider>().user!.id,
                                recipeUser.id),
                          );
                      context
                          .read<FollowProvider>()
                          .eitherOtherUserFollowersOrFailure(
                              params: FollowUserParams(userID: recipeUser.id));
                      context
                          .read<FollowProvider>()
                          .eitherUserFollowedOrFailure(
                              params: FollowUserParams(
                                  userID:
                                      context.read<UserProvider>().user!.id));
                    });
                  }

                  void unFollow() {
                    context
                        .read<FollowProvider>()
                        .eitherUnFollowUserOrFailure(
                          params: FollowParams(
                              context.read<UserProvider>().user!.id,
                              recipeUser.id),
                        )
                        .then((value) {
                      context.read<FollowProvider>().eitherIsFollowedOrFailure(
                            params: FollowParams(
                                context.read<UserProvider>().user!.id,
                                recipeUser.id),
                          );
                      context
                          .read<FollowProvider>()
                          .eitherOtherUserFollowersOrFailure(
                              params: FollowUserParams(userID: recipeUser.id));
                      context
                          .read<FollowProvider>()
                          .eitherUserFollowedOrFailure(
                              params: FollowUserParams(
                                  userID:
                                      context.read<UserProvider>().user!.id));
                    });
                  }

                  bool? isFollow =
                      context.watch<FollowProvider>().isFollowedUser;
                  Failure? failure =
                      context.watch<FollowProvider>().isFollowedFailure;
                  late Widget child;
                  if (isFollow != null) {
                    child = isActiveUser
                        ? const SizedBox()
                        : RedElevationButton(
                            onTap: isFollow ? unFollow : follow,
                            text: isFollow ? "UnFollow" : "Follow",
                            width: context.width(Sizes.s0_2_7),
                            height: context.height(Sizes.s0_0_6),
                          );
                  } else if (failure != null) {
                    child = isActiveUser
                        ? const SizedBox()
                        : RedElevationButton(
                            onTap: follow,
                            text: "Follow",
                            width: context.width(Sizes.s0_2_7),
                            height: context.height(Sizes.s0_0_6),
                          );
                  } else {
                    child = const SizedBox();
                  }
                  return child;
                }),
        );
      });
    } else if (recipeUserFailure != null) {
      userListTile = Center(
        child: Text(recipeUserFailure.message),
      );
    } else {
      userListTile = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return userListTile;
  }
}
