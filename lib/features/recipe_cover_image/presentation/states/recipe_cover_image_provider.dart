import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_cover_image_params.dart';
import '../../data/data_sources/remote_recipe_cover_image_data_source.dart';
import '../../data/repositories/recipe_cover_image_repository_impl.dart';
import '../../domain/entities/recipe_cover_image_entity.dart';
import '../../domain/repositories/recipe_cover_image_repository.dart';
import '../../domain/usecases/add_recipe_cover_image_usecase.dart';
import '../../domain/usecases/remove_recipe_cover_image_usecase.dart';

class RecipeCoverImageProvider extends ChangeNotifier {
  RecipeCoverImageEntity? recipeCoverImageEntity;
  Failure? failure;
  Failure? removeFailure;
  Future<Either<Failure, RecipeCoverImageEntity>> eitherAddRecipeCoverImage(
      {required RecipeCoverImageParams params}) async {
    RecipeCoverImageRepository repository =
        RecipeCoverImageRepositoryImpl(RecipeCoverImageFireStorage());

    return await AddRecipeCoverImageUseCase(repository).call(params);
  }

  Future<void> eitherRemoveRecipeCoverImage(
      {required RemoveRecipeCoverImageParams params}) async {
    RecipeCoverImageRepository repository =
        RecipeCoverImageRepositoryImpl(RecipeCoverImageFireStorage());

    final eitherFailureOrRecipeCoverEntity =
        await RemoveRecipeCoverImageUseCase(repository).call(params);

    eitherFailureOrRecipeCoverEntity.fold(
      (f) {
        removeFailure = f;
        notifyListeners();
      },
      (r) {
        removeFailure = null;
        notifyListeners();
      },
    );
  }
}
