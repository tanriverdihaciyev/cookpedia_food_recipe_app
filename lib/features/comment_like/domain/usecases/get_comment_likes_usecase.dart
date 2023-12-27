import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_likes_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/comment_like_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentLikesUseCase
    extends UseCase<Either<Failure, int>, CommentLikesParams> {
  final CommentLikeRepository _repository;

  GetCommentLikesUseCase(this._repository);
  @override
  Future<Either<Failure, int>> call(CommentLikesParams params) async {
    return await _repository.getCommentLikes(params: params);
  }
}
