import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/recipe_constants.dart';
import '../../domain/entities/recipe_cover_image_entity.dart';

class RecipeCoverImageModel extends RecipeCoverImageEntity {
  const RecipeCoverImageModel({required String imageURL})
      : super(imageURL: imageURL);

  factory RecipeCoverImageModel.fromDoc(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return RecipeCoverImageModel(imageURL: doc[kImageURL]);
  }

  Map<String, dynamic> toJson() {
    return {kImageURL: imageURL};
  }
}
