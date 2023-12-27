import '../../features/comment/domain/entities/comment_entity.dart';

class CommentParams {
  final String recipeID;

  CommentParams({required this.recipeID});
}

class AddCommentParams {
  final CommentEntity commentEntity;
  final String recipeID;

  AddCommentParams({required this.commentEntity, required this.recipeID});
}

class DeleteCommentParams {
  final String commentID;
  final String recipeID;

  DeleteCommentParams({required this.commentID, required this.recipeID});
}
