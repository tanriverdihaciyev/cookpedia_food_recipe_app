import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/recipe_visit_params.dart';

abstract class RecipeVisitRemoteDataSource {
  Future<void> addRecipeVisit({required RecipeVisitParams params});
}

class RecipeVisitFireBase implements RecipeVisitRemoteDataSource {
  final _recipeVisitFirebase =
      FirebaseFirestore.instance.collection(kRecipeVisits);
  @override
  Future<void> addRecipeVisit({required RecipeVisitParams params}) async {
    await _recipeVisitFirebase
        .doc(params.recipeID)
        .collection(kVisitors)
        .doc(params.visitorID)
        .set({})
        .then((value) => null)
        .onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
  }
}
