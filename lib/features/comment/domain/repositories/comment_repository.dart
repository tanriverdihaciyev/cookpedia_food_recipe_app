import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_params.dart';
import '../entities/comment_entity.dart';

abstract class CommentRepository {
  Future<Either<Failure, void>> addComment({required AddCommentParams params});
  Future<Either<Failure, void>> deleteComment(
      {required DeleteCommentParams params});
  Future<Either<Failure, void>> changeComment(
      {required AddCommentParams params});
  Future<Either<Failure, List<CommentEntity>>> getComments(
      {required CommentParams params});
}
