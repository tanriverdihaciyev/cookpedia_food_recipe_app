import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/comment_like_repository.dart';

class IsLikedCommentUseCase
    extends UseCase<Either<Failure, bool>, CommentLikesParams> {
  final CommentLikeRepository _repository;

  IsLikedCommentUseCase(this._repository);
  @override
  Future<Either<Failure, bool>> call(CommentLikesParams params) async {
    return await _repository.isLikedComment(params: params);
  }
}
