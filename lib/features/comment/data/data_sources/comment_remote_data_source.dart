import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/comment_params.dart';
import '../models/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<void> addComment({required AddCommentParams params});
  Future<void> deleteComment({required DeleteCommentParams params});
  Future<void> changeComment({required AddCommentParams params});
  Future<List<CommentModel>> getComments({required CommentParams params});
}

class CommentFirebaseService implements CommentRemoteDataSource {
  final _commentFireService = FirebaseFirestore.instance;

  @override
  Future<void> addComment({required AddCommentParams params}) async {
    await _commentFireService
        .collection(kComments)
        .doc(params.recipeID)
        .collection(kRecipeComments)
        .add(CommentModel.fromEntity(params.commentEntity).toJson())
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }

  @override
  Future<List<CommentModel>> getComments(
      {required CommentParams params}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _commentFireService
        .collection(kComments)
        .doc(params.recipeID)
        .collection(kRecipeComments)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((e) => CommentModel.fromDoc(e)).toList();
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> changeComment({required AddCommentParams params}) async {
    await _commentFireService
        .collection(kComments)
        .doc(params.recipeID)
        .collection(kRecipeComments)
        .doc(params.commentEntity.commentID)
        .set(CommentModel.fromEntity(params.commentEntity).toJson())
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }

  @override
  Future<void> deleteComment({required DeleteCommentParams params}) async {
    await _commentFireService
        .collection(kComments)
        .doc(params.recipeID)
        .collection(kRecipeComments)
        .doc(params.commentID)
        .delete()
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }
}
