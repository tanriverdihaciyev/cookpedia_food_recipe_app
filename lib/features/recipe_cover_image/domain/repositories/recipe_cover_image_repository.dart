import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_cover_image_params.dart';
import '../entities/recipe_cover_image_entity.dart';

abstract class RecipeCoverImageRepository {
  Future<Either<Failure, RecipeCoverImageEntity>> addRecipeCoverImage(
      {required RecipeCoverImageParams params});
  Future<Either<Failure, void>> removeRecipeCoverImage(
      {required RemoveRecipeCoverImageParams params});
}
