import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../features/comment/presentation/states/comment_provider.dart';
import '../../../features/recipe/domain/entities/recipe_entity.dart';
import '../../../features/recipe_view/presentation/states/recipe_view_provider.dart';
import '../../../features/recipe_visit/presentation/states/recipe_visit_provider.dart';
import '../../../features/saved_recipes/presentation/states/saved_recipe_provider.dart';
import '../../../features/user/domain/entities/user_entity.dart';
import '../../../features/user/presentation/states/user_provider.dart';
import '../../../features/user_visit/presentation/states/user_visit_provider.dart';
import '../../errors/failures.dart';
import '../../extensions/context_ext.dart';
import '../../params/comment_params.dart';
import '../../params/recipe_visit_params.dart';
import '../../params/saved_recipe_params.dart';
import '../../params/user_params.dart';
import '../../params/user_visit_params.dart';
import '../../resources/assets.dart';
import '../../resources/routes.dart';
import '../../resources/sizes.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({
    super.key,
    required this.recipeEntity,
  });

  final RecipeEntity recipeEntity;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard>
    with AutomaticKeepAliveClientMixin<RecipeCard> {
  bool isSharedUser(BuildContext context) {
    return context.watch<UserProvider>().user!.id ==
        widget.recipeEntity.sharedUserId;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListenableProvider<SavedRecipeProvider>(
      create: (context) => SavedRecipeProvider()
        ..eitherIsSavedRecipe(
          params: SavedRecipeParams(
              userID: context.read<UserProvider>().user!.id,
              recipeID: widget.recipeEntity.id!),
        ),
      child: SizedBox(
        width: context.width(Sizes.s0_4_5),
        child: Card(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.recipeEntity.coverImages.first,
                    ),
                  ),
                ),
                width: double.infinity,
              ),
              Positioned(
                bottom: Sizes.s0.toDouble(),
                child: Container(
                  height: context.height(Sizes.s0_2),
                  width: 183,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.transparent,
                    ], begin: Alignment(0, 1), end: Alignment(0, 0)),
                  ),
                ),
              ),
              Positioned(
                bottom: Sizes.s0.toDouble(),
                child: TextButton(
                  onPressed: () {
                    if (context.read<UserProvider>().user != null) {
                      context.read<RecipeVisitProvider>().eitherAddRecipeVisit(
                            params: RecipeVisitParams(
                              visitorID: context.read<UserProvider>().user!.id,
                              recipeID: widget.recipeEntity.id!,
                            ),
                          );
                    }

                    context
                        .read<RecipeViewProvider>()
                        .setParams(widget.recipeEntity);
                    context.read<UserProvider>().eitherGetRecipeUserOrFailure(
                          params:
                              UserParams(id: widget.recipeEntity.sharedUserId),
                        );
                    context.read<CommentProvider>().eitherGetComments(
                          params:
                              CommentParams(recipeID: widget.recipeEntity.id!),
                        );
                    context.read<SavedRecipeProvider>().eitherIsSavedRecipe(
                          params: SavedRecipeParams(
                              userID: context.read<UserProvider>().user!.id,
                              recipeID: widget.recipeEntity.id!),
                        );
                    context.go(Routes.recipeViewRoute);
                  },
                  child: SizedBox(
                    width: context.width(Sizes.s0_4),
                    child: Text(
                      widget.recipeEntity.title,
                      style: context.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: Sizes.s0.toDouble(),
                child: isSharedUser(context)
                    ? IconButton(
                        onPressed: () {},
                        icon: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.change_circle,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : SaveRecipeButton(recipeId: widget.recipeEntity.id!),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SaveRecipeButton extends StatelessWidget {
  const SaveRecipeButton({super.key, required this.recipeId});
  final String recipeId;

  @override
  Widget build(BuildContext context) {
    void saveRecipe() {
      if (context.read<UserProvider>().user != null) {
        context
            .read<SavedRecipeProvider>()
            .eitherSaveRecipe(
              params: SavedRecipeParams(
                  userID: context.read<UserProvider>().user!.id,
                  recipeID: recipeId),
            )
            .then((value) {
          context.read<SavedRecipeProvider>().eitherIsSavedRecipe(
                params: SavedRecipeParams(
                    userID: context.read<UserProvider>().user!.id,
                    recipeID: recipeId),
              );
        });
      }
    }

    void unSaveRecipe() {
      if (context.read<UserProvider>().user != null) {
        context
            .read<SavedRecipeProvider>()
            .eitherUnSaveRecipe(
                params: SavedRecipeParams(
                    userID: context.read<UserProvider>().user!.id,
                    recipeID: recipeId))
            .then(
          (value) {
            context.read<SavedRecipeProvider>().eitherIsSavedRecipe(
                  params: SavedRecipeParams(
                      userID: context.read<UserProvider>().user!.id,
                      recipeID: recipeId),
                );
          },
        );
      }
    }

    bool? isSaved = context.watch<SavedRecipeProvider>().isSavedRecipe;
    Failure? failure =
        context.watch<SavedRecipeProvider>().isSavedRecipeFailure;
    late Widget child;
    if (isSaved != null) {
      child = IconButton(
        onPressed: isSaved ? unSaveRecipe : saveRecipe,
        icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.white,
          ),
        ),
      );
    } else if (failure != null) {
      child = IconButton(
        onPressed: saveRecipe,
        icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.bookmark_border,
            color: Colors.white,
          ),
        ),
      );
    } else {
      child = const SizedBox();
      context.read<SavedRecipeProvider>().eitherIsSavedRecipe(
            params: SavedRecipeParams(
                userID: context.read<UserProvider>().user!.id,
                recipeID: recipeId),
          );
    }
    return child;
  }
}

class ChefCard extends StatelessWidget {
  const ChefCard({
    super.key,
    required this.userEntity,
    this.width,
  });

  final UserEntity userEntity;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width(Sizes.s0_4_5),
      child: Card(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: userEntity.profileImage != null
                    ? NetworkImage(
                        userEntity.profileImage!,
                      )
                    : AssetImage(AssetsPaths.chef.imageToPath) as ImageProvider,
              ),
            ),
            width: double.infinity,
          ),
          Positioned(
            bottom: Sizes.s0.toDouble(),
            child: Container(
              height: context.height(Sizes.s0_2),
              width: 183,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.transparent,
                ], begin: Alignment(0, 1), end: Alignment(0, 0)),
              ),
            ),
          ),
          Positioned(
            bottom: Sizes.s0.toDouble(),
            child: TextButton(
              onPressed: () {
                context.read<UserProvider>().eitherGetOtherUserOrFailure(
                      params: UserParams(id: userEntity.id),
                    );

                context.read<UserVisitProvider>().eitherAddUserVisit(
                      params: UserVisitParams(
                          activeUserId: context.read<UserProvider>().user!.id,
                          visitUserId: userEntity.id),
                    );
                context.go(Routes.profileRoute, extra: userEntity);
              },
              child: SizedBox(
                width: context.width(Sizes.s0_4),
                child: Text(
                  userEntity.fullName!,
                  style: context.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
