import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/comment_like_repository.dart';

class UnLikeCommentUseCase
    extends UseCase<Either<Failure, void>, CommentLikesParams> {
  final CommentLikeRepository _repository;

  UnLikeCommentUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(CommentLikesParams params) async {
    return await _repository.unLikeComment(params: params);
  }
}
