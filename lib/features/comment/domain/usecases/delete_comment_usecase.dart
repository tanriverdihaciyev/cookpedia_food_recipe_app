import 'package:cookpedia_foodrecipe_app/core/params/comment_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/comment_repository.dart';

class DeleteCommentsUseCase
    extends UseCase<Either<Failure, void>, DeleteCommentParams> {
  final CommentRepository _repository;

  DeleteCommentsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteCommentParams params) async {
    return await _repository.deleteComment(params: params);
  }
}
