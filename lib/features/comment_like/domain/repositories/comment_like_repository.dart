import 'package:cookpedia_foodrecipe_app/core/errors/failures.dart';
import 'package:cookpedia_foodrecipe_app/core/params/comment_likes_params.dart';
import 'package:dartz/dartz.dart';

abstract class CommentLikeRepository {
  Future<Either<Failure, int>> getCommentLikes(
      {required CommentLikesParams params});
  Future<Either<Failure, void>> likeComment(
      {required CommentLikesParams params});
  Future<Either<Failure, void>> unLikeComment(
      {required CommentLikesParams params});
  Future<Either<Failure, bool>> isLikedComment(
      {required CommentLikesParams params});
}
