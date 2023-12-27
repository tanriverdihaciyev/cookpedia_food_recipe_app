import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/comment_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../comment/data/models/comment_model.dart';
import '../../../comment/presentation/states/comment_provider.dart';
import '../states/recipe_view_provider.dart';
import '../states/rv_add_comment_text_controller_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVAddCommentWidget extends StatefulWidget {
  const RVAddCommentWidget({super.key});

  @override
  State<RVAddCommentWidget> createState() => _RVAddCommentWidgetState();
}

class _RVAddCommentWidgetState extends State<RVAddCommentWidget> {
  String? newComment;
  late GlobalKey<FormState> formKey;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    if (context
            .watch<RVAddCommentTextControllerProvider>()
            .textEditingController !=
        null) {
      focusNode.requestFocus();
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(context.watch<UserProvider>().user!.profileImage!),
          ),
          title: Form(
            key: formKey,
            child: Card(
              child: SizedBox(
                width: context.width(Sizes.s0_8),
                child: TextFormField(
                  controller: context
                      .watch<RVAddCommentTextControllerProvider>()
                      .textEditingController,
                  focusNode: focusNode,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Is Not Empty";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      newComment = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15),
                    hintText: "Add a comment",
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (newComment != null) {
                            if (context
                                    .read<RVAddCommentTextControllerProvider>()
                                    .textEditingController !=
                                null) {
                              await context
                                  .read<CommentProvider>()
                                  .eitherChangeComment(
                                      params: AddCommentParams(
                                    commentEntity: context
                                        .read<
                                            RVAddCommentTextControllerProvider>()
                                        .commentEntity!
                                        .copyWith(comment: newComment),
                                    recipeID: context
                                        .read<RecipeViewProvider>()
                                        .recipe
                                        .id!,
                                  ))
                                  .then((value) async {
                                setState(() {
                                  newComment = null;
                                });
                                context
                                    .read<RVAddCommentTextControllerProvider>()
                                    .textEditingController!
                                    .clear();
                                await context
                                    .read<CommentProvider>()
                                    .eitherGetComments(
                                      params: CommentParams(
                                          recipeID: context
                                              .read<RecipeViewProvider>()
                                              .recipe
                                              .id!),
                                    )
                                    .then((value) {
                                  context
                                      .read<
                                          RVAddCommentTextControllerProvider>()
                                      .resetAll();

                                  focusNode.unfocus();

                                  formKey.currentState!.reset();
                                });
                              });
                            } else {
                              await context
                                  .read<CommentProvider>()
                                  .eitherAddComment(
                                    params: AddCommentParams(
                                        commentEntity: CommentModel(
                                          commentUserID: context
                                              .read<UserProvider>()
                                              .user!
                                              .id,
                                          comment: newComment!,
                                          commentDate: DateTime.now(),
                                        ),
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
                                              .id!),
                                    )
                                    .then((value) {
                                  context
                                      .read<
                                          RVAddCommentTextControllerProvider>()
                                      .resetAll();

                                  focusNode.unfocus();

                                  formKey.currentState!.reset();
                                  setState(() {
                                    newComment = null;
                                  });
                                });
                              });
                            }
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.telegram,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
