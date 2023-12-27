import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../comment_like/presentation/states/comment_like_provider.dart';
import '../states/rv_add_comment_text_controller_provider.dart';
import '../states/rv_cover_view_index_provider.dart';
import '../widgets/rv_scaffold_widget.dart';

class RecipeViewPage extends StatelessWidget {
  const RecipeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => RVCoverViewIndexProvider(),
        ),
        ListenableProvider(
          create: (context) => CommentLikeProvider(),
        ),
        ListenableProvider(
          create: (context) => RVAddCommentTextControllerProvider(),
        ),
      ],
      child: const RVScaffoldWidget(),
    );
  }
}
