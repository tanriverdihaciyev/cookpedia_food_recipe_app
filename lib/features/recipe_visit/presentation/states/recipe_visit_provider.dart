import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_visit_params.dart';
import '../../data/data_sources/recipe_visit_remote_data_source.dart';
import '../../data/repositories/recipe_visit_repo_impl.dart';
import '../../domain/usecases/add_recipe_visit_usecase.dart';

class RecipeVisitProvider extends ChangeNotifier {
  Failure? failure;
  Future<void> eitherAddRecipeVisit({required RecipeVisitParams params}) async {
    final repo = RecipeVisitRepositoryImpl(RecipeVisitFireBase());
    final either = await AddRecipeVisitUseCase(repo).call(params);
    either.fold((l) {
      failure = l;
      notifyListeners();
    }, (r) {
      failure = null;
      notifyListeners();
    });
  }
}
