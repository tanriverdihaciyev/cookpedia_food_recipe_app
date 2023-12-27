import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/recipe_instruction_image_params.dart';
import '../models/recipe_instruction_image_model.dart';

abstract class RemoteRecipeInstructionImageDataSource {
  Future<RecipeInstructionImageModel> addRecipeInstructionImage(
      {required RecipeInstructionImageParams params});
  Future<void> removeRecipeInstructionImage(
      {required RemoveRecipeInstructionImageParams params});
}

class RecipeInstructionImageFireStorage
    implements RemoteRecipeInstructionImageDataSource {
  final _recipeInstructionFireStorage = FirebaseStorage.instance.ref();
  late String _recipeInstructionImageID;

  @override
  Future<RecipeInstructionImageModel> addRecipeInstructionImage(
      {required RecipeInstructionImageParams params}) async {
    _recipeInstructionImageID = const Uuid().v4();
    String imageName = "instructionImage_$_recipeInstructionImageID.jpg";
    UploadTask uploadTask = _recipeInstructionFireStorage
        .child("$kInstructionImage/${params.userID}/$imageName")
        .putFile(params.instructionImage);
    TaskSnapshot snapshot = await uploadTask;
    String? imageURL = await snapshot.ref.getDownloadURL().onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
    return RecipeInstructionImageModel(instructionImageURL: imageURL);
  }

  @override
  Future<void> removeRecipeInstructionImage(
      {required RemoveRecipeInstructionImageParams params}) async {
    RegExp search = RegExp(r"instructionImage_.+\.jpg");
    var equal = search.firstMatch(params.instructionImageURL);
    String? imageName = equal?[0];
    if (imageName != null) {
      await _recipeInstructionFireStorage
          .child("$kInstructionImage/${params.userID}/$imageName")
          .delete();
    } else {
      throw FirebaseServerException();
    }
  }
}
