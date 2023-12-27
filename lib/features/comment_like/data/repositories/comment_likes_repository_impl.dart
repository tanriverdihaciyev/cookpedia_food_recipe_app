import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../data_sources/comment_likes_remote_data_source.dart';
import '../../domain/repositories/comment_like_repository.dart';
import 'package:dartz/dartz.dart';

class CommentLikeRepositoryImpl implements CommentLikeRepository {
  final CommentLikesRemoteDataSource _remoteDataSource;

  CommentLikeRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, int>> getCommentLikes(
      {required CommentLikesParams params}) async {
    try {
      final remoteCommentLikes =
          await _remoteDataSource.getCommentLikes(params: params);
      return Right(remoteCommentLikes);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isLikedComment(
      {required CommentLikesParams params}) async {
    try {
      final remoteIsLikedComment =
          await _remoteDataSource.isLikedComment(params: params);
      return Right(remoteIsLikedComment);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> likeComment(
      {required CommentLikesParams params}) async {
    try {
      final remoteLikeComment =
          await _remoteDataSource.likeComment(params: params);
      return Right(remoteLikeComment);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> unLikeComment(
      {required CommentLikesParams params}) async {
    try {
      final remoteLikeComment =
          await _remoteDataSource.unLikeComment(params: params);
      return Right(remoteLikeComment);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }
}
