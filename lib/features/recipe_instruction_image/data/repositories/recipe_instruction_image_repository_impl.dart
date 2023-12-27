import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../../domain/entities/recipe_instruction_image_entity.dart';
import '../../domain/repositories/recipe_instruction_image_repository.dart';
import '../data_sources/remote_recipe_instruction_image_data_source.dart';

class RecipeInstructionImageRepositoryImpl
    implements RecipeInstructionImageRepository {
  final RemoteRecipeInstructionImageDataSource
      _remoteRecipeInstructionImageDataSource;

  RecipeInstructionImageRepositoryImpl(
      this._remoteRecipeInstructionImageDataSource);

  @override
  Future<Either<Failure, RecipeInstructionImageEntity>>
      addRecipeInstructionImage(
          {required RecipeInstructionImageParams params}) async {
    try {
      var remoteRecipeInstructionImage =
          await _remoteRecipeInstructionImageDataSource
              .addRecipeInstructionImage(params: params);
      return Right(remoteRecipeInstructionImage);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> removeRecipeInstructionImage(
      {required RemoveRecipeInstructionImageParams params}) async {
    try {
      await _remoteRecipeInstructionImageDataSource
          .removeRecipeInstructionImage(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
