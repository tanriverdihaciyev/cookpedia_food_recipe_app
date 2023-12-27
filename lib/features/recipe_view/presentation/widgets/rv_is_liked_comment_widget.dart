import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../../comment/domain/entities/comment_entity.dart';
import '../../../comment_like/presentation/states/comment_like_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVIsLikedCommentWidget extends StatefulWidget {
  const RVIsLikedCommentWidget({super.key, required this.commentEntity});
  final CommentEntity commentEntity;

  @override
  State<RVIsLikedCommentWidget> createState() => _RVIsLikedCommentWidgetState();
}

class _RVIsLikedCommentWidgetState extends State<RVIsLikedCommentWidget> {
  bool? isLikedComment;
  Failure? isLikedCommentFailure;
  @override
  Widget build(BuildContext context) {
    context
        .watch<CommentLikeProvider>()
        .eitherIsLikedComment(
          params: CommentLikesParams(
              userID: context.read<UserProvider>().user!.id,
              commentID: widget.commentEntity.commentID!),
        )
        .then((value) {
      value.fold((l) {
        isLikedComment = null;
        isLikedCommentFailure = l;
        if (mounted) {
          setState(() {});
        }
      }, (r) {
        isLikedComment = r;
        isLikedCommentFailure = null;
        if (mounted) {
          setState(() {});
        }
      });
    });
    late Widget isLikedCommentWidget;
    if (isLikedComment != null) {
      isLikedCommentWidget = InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () async {
            await context
                .read<CommentLikeProvider>()
                .eitherUnLikeComment(
                    params: CommentLikesParams(
                        userID: context.read<UserProvider>().user!.id,
                        commentID: widget.commentEntity.commentID!))
                .then((value) {
              context.read<CommentLikeProvider>().eitherGetCommentLikes(
                    params: CommentLikesParams(
                        userID: context.read<UserProvider>().user!.id,
                        commentID: widget.commentEntity.commentID!),
                  );
            });
          },
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ));
    } else if (isLikedCommentFailure != null) {
      isLikedCommentWidget = InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () async {
            await context
                .read<CommentLikeProvider>()
                .eitherLikeComment(
                  params: CommentLikesParams(
                      userID: context.read<UserProvider>().user!.id,
                      commentID: widget.commentEntity.commentID!),
                )
                .then((value) {
              context.read<CommentLikeProvider>().eitherGetCommentLikes(
                    params: CommentLikesParams(
                        userID: context.read<UserProvider>().user!.id,
                        commentID: widget.commentEntity.commentID!),
                  );
            });
          },
          child: const Icon(Icons.favorite_border));
    } else {
      isLikedCommentWidget = const SizedBox();
    }
    return isLikedCommentWidget;
  }
}
