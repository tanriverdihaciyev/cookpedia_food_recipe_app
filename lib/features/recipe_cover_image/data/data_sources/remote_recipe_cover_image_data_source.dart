import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/params/recipe_cover_image_params.dart';
import '../models/recipe_cover_image_model.dart';

abstract class RemoteRecipeCoverImageDataSource {
  Future<RecipeCoverImageModel> addRecipeCoverImage(
      {required RecipeCoverImageParams params});
  Future<void> removeRecipeCoverImage(
      {required RemoveRecipeCoverImageParams params});
}

class RecipeCoverImageFireStorage extends RemoteRecipeCoverImageDataSource {
  final _recipeFireStorage = FirebaseStorage.instance.ref();
  late String _recipeCoverImageID;
  @override
  Future<RecipeCoverImageModel> addRecipeCoverImage(
      {required RecipeCoverImageParams params}) async {
    _recipeCoverImageID = const Uuid().v4();
    String imageName = "recipeCoverImage_$_recipeCoverImageID.jpg";
    UploadTask uploadTask = _recipeFireStorage
        .child("$kRecipeCovers/${params.userID}/$imageName")
        .putFile(params.imagePath);
    TaskSnapshot snapshot = await uploadTask;
    String? imageURL = await snapshot.ref
        .getDownloadURL()
        .onError((error, stackTrace) => throw FirebaseServerException());

    return RecipeCoverImageModel(imageURL: imageURL);
  }

  @override
  Future<void> removeRecipeCoverImage(
      {required RemoveRecipeCoverImageParams params}) async {
    RegExp search = RegExp(r'recipeCoverImage_.+\.jpg');
    var equal = search.firstMatch(params.recipeCoverImageUrl);
    String? imageName = equal?[0];
    if (imageName != null) {
      await _recipeFireStorage
          .child("$kRecipeCovers/${params.userID}/$imageName")
          .delete();
    } else {
      throw FirebaseServerException();
    }
  }
}
