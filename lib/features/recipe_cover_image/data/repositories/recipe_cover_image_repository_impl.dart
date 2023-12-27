import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_cover_image_params.dart';
import '../../domain/entities/recipe_cover_image_entity.dart';
import '../../domain/repositories/recipe_cover_image_repository.dart';
import '../data_sources/remote_recipe_cover_image_data_source.dart';

class RecipeCoverImageRepositoryImpl implements RecipeCoverImageRepository {
  final RemoteRecipeCoverImageDataSource _remoteRecipeCoverImageDataSource;

  RecipeCoverImageRepositoryImpl(this._remoteRecipeCoverImageDataSource);
  @override
  Future<Either<Failure, RecipeCoverImageEntity>> addRecipeCoverImage(
      {required RecipeCoverImageParams params}) async {
    try {
      var remotoRecipeCoverImage = await _remoteRecipeCoverImageDataSource
          .addRecipeCoverImage(params: params);
      return Right(remotoRecipeCoverImage);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeRecipeCoverImage(
      {required RemoveRecipeCoverImageParams params}) async {
    try {
      await _remoteRecipeCoverImageDataSource.removeRecipeCoverImage(
          params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }
}
