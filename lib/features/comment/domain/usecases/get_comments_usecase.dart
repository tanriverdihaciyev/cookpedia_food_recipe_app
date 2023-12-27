import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/comment_entity.dart';
import '../repositories/comment_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentsUseCase
    extends UseCase<Either<Failure, List<CommentEntity>>, CommentParams> {
  final CommentRepository _repository;

  GetCommentsUseCase(this._repository);
  @override
  Future<Either<Failure, List<CommentEntity>>> call(
      CommentParams params) async {
    return await _repository.getComments(params: params);
  }
}
