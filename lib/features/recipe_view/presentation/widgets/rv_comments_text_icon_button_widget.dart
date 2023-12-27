import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../comment/domain/entities/comment_entity.dart';
import '../../../comment/presentation/states/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RVCommentsTextAndIconButtonWidget extends StatelessWidget {
  const RVCommentsTextAndIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommentEntity>? comments = context.watch<CommentProvider>().comments;
    Failure? failure = context.watch<CommentProvider>().failure;
    late Widget commentText;

    if (comments != null) {
      commentText = Text(
        "Comments (${comments.length})",
        style: context.textTheme.bodyLarge,
      );
    } else if (failure != null) {
      commentText = Text(
        "Comments (0)",
        style: context.textTheme.bodyLarge,
      );
    } else {
      commentText = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commentText,
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
