import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_visit_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/recipe_visit_repository.dart';

class AddRecipeVisitUseCase
    extends UseCase<Either<Failure, void>, RecipeVisitParams> {
  final RecipeVisitRepository _repository;

  AddRecipeVisitUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(RecipeVisitParams params) async {
    return _repository.addRecipeVisit(params: params);
  }
}
