import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_params.dart';
import '../../data/data_sources/comment_remote_data_source.dart';
import '../../data/repositories/comment_repository_impl.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/repositories/comment_repository.dart';

class CommentProvider extends ChangeNotifier {
  List<CommentEntity>? comments;
  Failure? failure;
  Failure? addCommentFailure;
  Failure? deleteCommentFailure;
  Failure? changeCommentFailure;

  Future<void> eitherAddComment({required AddCommentParams params}) async {
    CommentRepository repository =
        CommentRepositoryImpl(CommentFirebaseService());

    final eitherVoidOrFailure = await repository.addComment(params: params);

    eitherVoidOrFailure.fold((l) {
      addCommentFailure = l;
      notifyListeners();
    }, (r) {
      addCommentFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherDeleteComment(
      {required DeleteCommentParams params}) async {
    CommentRepository repository =
        CommentRepositoryImpl(CommentFirebaseService());

    final eitherVoidOrFailure = await repository.deleteComment(params: params);

    eitherVoidOrFailure.fold((l) {
      deleteCommentFailure = l;
      notifyListeners();
    }, (r) {
      deleteCommentFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherChangeComment({required AddCommentParams params}) async {
    CommentRepository repository =
        CommentRepositoryImpl(CommentFirebaseService());

    final eitherVoidOrFailure = await repository.changeComment(params: params);

    eitherVoidOrFailure.fold((l) {
      changeCommentFailure = l;
      notifyListeners();
    }, (r) {
      changeCommentFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetComments({required CommentParams params}) async {
    CommentRepository repository =
        CommentRepositoryImpl(CommentFirebaseService());

    final eitherVoidOrFailure = await repository.getComments(params: params);

    eitherVoidOrFailure.fold((l) {
      failure = l;
      comments = null;
      notifyListeners();
    }, (r) {
      comments = r;
      failure = null;
      notifyListeners();
    });
  }
}
