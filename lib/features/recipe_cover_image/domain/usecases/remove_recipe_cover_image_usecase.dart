import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_cover_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/recipe_cover_image_repository.dart';

class RemoveRecipeCoverImageUseCase
    extends UseCase<Either<Failure, void>, RemoveRecipeCoverImageParams> {
  RemoveRecipeCoverImageUseCase(this._repository);
  final RecipeCoverImageRepository _repository;

  @override
  Future<Either<Failure, void>> call(
      RemoveRecipeCoverImageParams params) async {
    return await _repository.removeRecipeCoverImage(params: params);
  }
}
