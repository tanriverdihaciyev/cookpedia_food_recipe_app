import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/comment_contsants.dart';
import '../../domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel(
      {String? commentID,
      required String commentUserID,
      required String comment,
      required DateTime commentDate})
      : super(
            comment: comment,
            commentDate: commentDate,
            commentUserID: commentUserID,
            commentID: commentID);

  factory CommentModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return CommentModel(
        commentUserID: doc.data()![kCommentUserID],
        comment: doc.data()![kComment],
        commentDate: (doc.data()![kCommentDate] as Timestamp?)!.toDate(),
        commentID: doc.id);
  }
  factory CommentModel.fromEntity(CommentEntity commentEntity) {
    return CommentModel(
        commentUserID: commentEntity.commentUserID,
        comment: commentEntity.comment,
        commentDate: commentEntity.commentDate,
        commentID: commentEntity.commentID);
  }

  Map<String, dynamic> toJson() {
    return {
      kComment: comment,
      kCommentDate: commentDate,
      kCommentUserID: commentUserID
    };
  }
}
