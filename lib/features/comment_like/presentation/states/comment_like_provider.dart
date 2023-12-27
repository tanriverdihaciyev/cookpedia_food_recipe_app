import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../data/data_sources/comment_likes_remote_data_source.dart';
import '../../data/repositories/comment_likes_repository_impl.dart';
import '../../domain/repositories/comment_like_repository.dart';
import '../../domain/usecases/get_comment_likes_usecase.dart';
import '../../domain/usecases/is_liked_comment_usecase.dart';
import '../../domain/usecases/like_comment_usecase.dart';
import '../../domain/usecases/un_like_comment_usecase.dart';
import 'package:flutter/foundation.dart';

class CommentLikeProvider extends ChangeNotifier {
  // int? commentLikes;
  // Failure? commentLikesFailure;
  // bool? isLikedComment;
  // Failure? isLikedCommentFailure;
  Failure? likeCommentFailure;
  Failure? unLikeCommentFailure;

  Future<Either<Failure, bool>> eitherIsLikedComment(
      {required CommentLikesParams params}) async {
    CommentLikeRepository repository =
        CommentLikeRepositoryImpl(CommentLikesFireService());
    return await IsLikedCommentUseCase(repository).call(params);
    // eitherIntOrFailure.fold((l) {
    //   isLikedComment = null;
    //   isLikedCommentFailure = l;
    //   notifyListeners();
    // }, (r) {
    //   isLikedComment = r;
    //   isLikedCommentFailure = null;
    //   notifyListeners();
    // });
  }

  Future<Either<Failure, int>> eitherGetCommentLikes(
      {required CommentLikesParams params}) async {
    CommentLikeRepository repository =
        CommentLikeRepositoryImpl(CommentLikesFireService());
    return await GetCommentLikesUseCase(repository).call(params);
    // eitherIntOrFailure.fold((l) {
    //   commentLikes = null;
    //   commentLikesFailure = l;
    //   notifyListeners();
    // }, (r) {
    //   commentLikes = r;
    //   commentLikesFailure = null;
    //   notifyListeners();
    // });
  }

  Future<void> eitherLikeComment({required CommentLikesParams params}) async {
    CommentLikeRepository repository =
        CommentLikeRepositoryImpl(CommentLikesFireService());
    final eitherIntOrFailure =
        await LikeCommentUseCase(repository).call(params);
    eitherIntOrFailure.fold((l) {
      likeCommentFailure = l;
      notifyListeners();
    }, (r) {
      likeCommentFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherUnLikeComment({required CommentLikesParams params}) async {
    CommentLikeRepository repository =
        CommentLikeRepositoryImpl(CommentLikesFireService());
    final eitherIntOrFailure =
        await UnLikeCommentUseCase(repository).call(params);
    eitherIntOrFailure.fold((l) {
      unLikeCommentFailure = l;
      notifyListeners();
    }, (r) {
      unLikeCommentFailure = null;
      notifyListeners();
    });
  }
}
