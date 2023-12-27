import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_cover_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_cover_image_entity.dart';
import '../repositories/recipe_cover_image_repository.dart';

class AddRecipeCoverImageUseCase extends UseCase<
    Either<Failure, RecipeCoverImageEntity>, RecipeCoverImageParams> {
  AddRecipeCoverImageUseCase(this._repository);
  final RecipeCoverImageRepository _repository;

  @override
  Future<Either<Failure, RecipeCoverImageEntity>> call(
      RecipeCoverImageParams params) async {
    return await _repository.addRecipeCoverImage(params: params);
  }
}
