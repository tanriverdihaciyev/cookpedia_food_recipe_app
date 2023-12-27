import 'package:cookpedia_foodrecipe_app/core/params/comment_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/comment_repository.dart';

class ChangeCommentsUseCase
    extends UseCase<Either<Failure, void>, AddCommentParams> {
  final CommentRepository _repository;

  ChangeCommentsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddCommentParams params) async {
    return await _repository.changeComment(params: params);
  }
}
