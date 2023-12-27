import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../../data/data_sources/remote_recipe_instruction_image_data_source.dart';
import '../../data/repositories/recipe_instruction_image_repository_impl.dart';
import '../../domain/entities/recipe_instruction_image_entity.dart';
import '../../domain/repositories/recipe_instruction_image_repository.dart';
import '../../domain/usecases/add_recipe_instruction_image_usecase.dart';
import '../../domain/usecases/remove_recipe_instruction_image_usecase.dart';

class RecipeInstructionImageProvider extends ChangeNotifier {
  RecipeInstructionImageEntity? recipeInstructionImageEntity;
  Failure? failure;

  Failure? removeFailure;
  Future<Either<Failure, RecipeInstructionImageEntity>>
      eitherAddRecipeInstructionImage(
          {required RecipeInstructionImageParams params}) async {
    RecipeInstructionImageRepository repository =
        RecipeInstructionImageRepositoryImpl(
      RecipeInstructionImageFireStorage(),
    );

    return await AddRecipeInstructionImageUseCase(repository).call(params);

    // eitherFailureOrRecipeInstructionImageEntity.fold((l) {
    //   recipeInstructionImageEntity = null;
    //   failure = l;
    //   notifyListeners();
    // }, (r) {
    //   recipeInstructionImageEntity = r;
    //   failure = null;
    //   notifyListeners();
    // });
  }

  eitherRemoveRecipeInstructionImage(
      {required RemoveRecipeInstructionImageParams params}) async {
    RecipeInstructionImageRepository repository =
        RecipeInstructionImageRepositoryImpl(
      RecipeInstructionImageFireStorage(),
    );

    final eitherFailureOrRecipeInstructionImageEntity =
        await RemoveRecipeInstructionImageUseCase(repository).call(params);

    eitherFailureOrRecipeInstructionImageEntity.fold((l) {
      removeFailure = l;
      notifyListeners();
    }, (r) {
      failure = null;
      notifyListeners();
    });
  }
}
