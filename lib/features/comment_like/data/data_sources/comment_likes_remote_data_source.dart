import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/comment_likes_params.dart';

abstract class CommentLikesRemoteDataSource {
  Future<int> getCommentLikes({required CommentLikesParams params});
  Future<void> likeComment({required CommentLikesParams params});
  Future<void> unLikeComment({required CommentLikesParams params});
  Future<bool> isLikedComment({required CommentLikesParams params});
}

class CommentLikesFireService implements CommentLikesRemoteDataSource {
  final _commentLikeFireService =
      FirebaseFirestore.instance.collection(kCommentLikes);

  @override
  Future<int> getCommentLikes({required CommentLikesParams params}) async {
    final snapshot = await _commentLikeFireService
        .doc(params.commentID)
        .collection(kCommentLikes)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.length;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<bool> isLikedComment({required CommentLikesParams params}) async {
    final snapshot = await _commentLikeFireService
        .doc(params.commentID)
        .collection(kCommentLikes)
        .doc(params.userID)
        .get();
    if (snapshot.exists) {
      return true;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> likeComment({required CommentLikesParams params}) async {
    await _commentLikeFireService
        .doc(params.commentID)
        .collection(kCommentLikes)
        .doc(params.userID)
        .set({})
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }

  @override
  Future<void> unLikeComment({required CommentLikesParams params}) async {
    await _commentLikeFireService
        .doc(params.commentID)
        .collection(kCommentLikes)
        .doc(params.userID)
        .delete()
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }
}
