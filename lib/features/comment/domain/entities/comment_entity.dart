import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String? commentID;
  final String commentUserID;
  final String comment;
  final DateTime commentDate;

  const CommentEntity(
      {this.commentID,
      required this.commentUserID,
      required this.comment,
      required this.commentDate});

  CommentEntity copyWith(
      {String? commentID,
      String? commentUserID,
      String? comment,
      DateTime? commentDate}) {
    return CommentEntity(
        commentID: commentID ?? this.commentID,
        commentUserID: commentUserID ?? this.commentUserID,
        comment: comment ?? this.comment,
        commentDate: commentDate ?? this.commentDate);
  }

  @override
  List<Object?> get props => [commentID];
}
