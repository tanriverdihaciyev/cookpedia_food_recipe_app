import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/comment_params.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/repositories/comment_repository.dart';
import '../data_sources/comment_remote_data_source.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource _remoteDataSource;

  CommentRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addComment(
      {required AddCommentParams params}) async {
    try {
      await _remoteDataSource.addComment(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(
      {required CommentParams params}) async {
    try {
      final remoteComments =
          await _remoteDataSource.getComments(params: params);
      return Right(remoteComments);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> changeComment(
      {required AddCommentParams params}) async {
    try {
      await _remoteDataSource.changeComment(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(
      {required DeleteCommentParams params}) async {
    try {
      await _remoteDataSource.deleteComment(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
