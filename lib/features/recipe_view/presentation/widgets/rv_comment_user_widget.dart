import 'package:cookpedia_foodrecipe_app/core/params/comment_params.dart';
import 'package:cookpedia_foodrecipe_app/features/comment/presentation/states/comment_provider.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/recipe_view_provider.dart';
import '../states/rv_add_comment_text_controller_provider.dart';
import 'rv_comment_likes_widget.dart';
import 'rv_is_liked_comment_widget.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../comment/domain/entities/comment_entity.dart';

class RVCommentAndUserWidget extends StatelessWidget {
  const RVCommentAndUserWidget({
    super.key,
    required this.commentEntity,
  });
  final CommentEntity commentEntity;

  Widget userListTile(BuildContext context) {
    UserEntity? userEntity = context.watch<UserProvider>().otherUser;
    Failure? failure = context.watch<UserProvider>().otherUserFailure;

    late Widget userListTile;
    if (userEntity != null) {
      bool isActiveUser =
          context.read<UserProvider>().user!.id == userEntity.id;
      bool isSharedRecipeUser =
          context.read<RecipeViewProvider>().recipe.sharedUserId ==
              context.read<UserProvider>().user!.id;
      userListTile = ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userEntity.profileImage!),
        ),
        title: Text(
          userEntity.fullName!,
          style: context.textTheme.titleMedium,
        ),
        trailing: isActiveUser
            ? PopupMenuButton(
                icon: const Icon(Icons.more_outlined),
                constraints:
                    BoxConstraints(maxWidth: context.width(Sizes.s0_5)),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.change_circle_outlined,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Change Comment"),
                        ],
                      ),
                      onTap: () {
                        RVAddCommentTextControllerProvider rvController =
                            context.read<RVAddCommentTextControllerProvider>();
                        rvController.addTextController(
                            TextEditingController(text: commentEntity.comment));
                        rvController.addCommentEntity(commentEntity);
                      },
                    ),
                    PopupMenuItem(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Remove Comment"),
                        ],
                      ),
                      onTap: () async {
                        await context
                            .read<CommentProvider>()
                            .eitherDeleteComment(
                              params: DeleteCommentParams(
                                  commentID: commentEntity.commentID!,
                                  recipeID: context
                                      .read<RecipeViewProvider>()
                                      .recipe
                                      .id!),
                            )
                            .then((value) async {
                          await context
                              .read<CommentProvider>()
                              .eitherGetComments(
                                  params: CommentParams(
                                      recipeID: context
                                          .read<RecipeViewProvider>()
                                          .recipe
                                          .id!));
                        });
                      },
                    ),
                  ];
                },
              )
            : isSharedRecipeUser
                ? PopupMenuButton(
                    icon: const Icon(Icons.more_outlined),
                    constraints:
                        BoxConstraints(maxWidth: context.width(Sizes.s0_5)),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Delete Comment"),
                            ],
                          ),
                          onTap: () async {
                            await context
                                .read<CommentProvider>()
                                .eitherDeleteComment(
                                  params: DeleteCommentParams(
                                      commentID: commentEntity.commentID!,
                                      recipeID: context
                                          .read<RecipeViewProvider>()
                                          .recipe
                                          .id!),
                                )
                                .then((value) async {
                              await context
                                  .read<CommentProvider>()
                                  .eitherGetComments(
                                      params: CommentParams(
                                          recipeID: context
                                              .read<RecipeViewProvider>()
                                              .recipe
                                              .id!));
                            });
                          },
                        ),
                      ];
                    },
                  )
                : null,
      );
    } else if (failure != null) {
      userListTile = Center(
        child: Text(failure.message),
      );
    } else {
      userListTile = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return userListTile;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userListTile(context),
          SizedBox(
            width: context.width(Sizes.s0_9),
            child: Text(
              commentEntity.comment,
              style: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RVIsLikedCommentWidget(commentEntity: commentEntity),
              const SizedBox(
                width: 10,
              ),
              RVCommentLikesWidget(commentEntity: commentEntity),
              const SizedBox(
                width: 10,
              ),
              Text(
                (commentEntity.commentDate).toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
