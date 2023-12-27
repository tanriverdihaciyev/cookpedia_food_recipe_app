import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../../comment/domain/entities/comment_entity.dart';
import '../../../comment_like/presentation/states/comment_like_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVCommentLikesWidget extends StatefulWidget {
  const RVCommentLikesWidget({super.key, required this.commentEntity});
  final CommentEntity commentEntity;

  @override
  State<RVCommentLikesWidget> createState() => _RVCommentLikesWidgetState();
}

class _RVCommentLikesWidgetState extends State<RVCommentLikesWidget> {
  int? commentLikes;
  Failure? commentLikesFailure;
  @override
  Widget build(BuildContext context) {
    context
        .watch<CommentLikeProvider>()
        .eitherGetCommentLikes(
          params: CommentLikesParams(
              userID: context.read<UserProvider>().user!.id,
              commentID: widget.commentEntity.commentID!),
        )
        .then((value) async {
      value.fold((l) {
        commentLikes = null;
        commentLikesFailure = l;
        if (mounted) {
          setState(() {});
        }
      }, (r) {
        commentLikes = r;
        commentLikesFailure = null;
        if (mounted) {
          setState(() {});
        }
      });
    });
    late Widget commentLikesWidget;
    if (commentLikes != null) {
      commentLikesWidget = Text("$commentLikes");
    } else if (commentLikesFailure != null) {
      commentLikesWidget = const Text("0");
    } else {
      commentLikesWidget = const SizedBox();
    }
    return commentLikesWidget;
  }
}
