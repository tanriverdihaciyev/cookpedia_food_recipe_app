import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/saved_recipe_enitity.dart';

class SavedRecipeModel extends SavedRecipeEntity {
  const SavedRecipeModel({required String savedRecipeID})
      : super(savedRecipeID: savedRecipeID);

  factory SavedRecipeModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return SavedRecipeModel(savedRecipeID: doc.id);
  }
}
