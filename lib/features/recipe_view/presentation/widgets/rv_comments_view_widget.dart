import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_params.dart';
import '../../../comment/domain/entities/comment_entity.dart';
import '../../../comment/presentation/states/comment_provider.dart';
import 'rv_comment_user_widget.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVCommentsView extends StatelessWidget {
  const RVCommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommentEntity>? comments = context.watch<CommentProvider>().comments;
    Failure? failure = context.watch<CommentProvider>().failure;
    late Widget commentAndUser;
    if (comments != null) {
      List<Widget> widgets = [];

      for (int i = 0; i < comments.length; i++) {
        if (i < 3) {
          context.read<UserProvider>().eitherGetOtherUserOrFailure(
              params: UserParams(id: comments[i].commentUserID));

          widgets.add(
            RVCommentAndUserWidget(commentEntity: comments[i]),
          );
        }
      }
      commentAndUser = Column(
        children: widgets,
      );
    } else if (failure != null) {
      commentAndUser = const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("No Comment"),
        ),
      );
    } else {
      commentAndUser = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return commentAndUser;
  }
}
