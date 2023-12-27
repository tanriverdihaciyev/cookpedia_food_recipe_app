import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/profil_image_params.dart';
import '../models/profil_image_model.dart';

abstract class ProfilImageRemoteDataSource {
  Future<ProfilImageModel> addProfilImage(
      {required AddProfilImageParams params});
  Future<ProfilImageModel> changeProfilImage(
      {required ChangeProfilImageParams params});
  Future<void> deleteProfilImage({required DeleteProfilImageParams params});
}

class ProfilImageFireStorageService implements ProfilImageRemoteDataSource {
  final _profilStorageService = FirebaseStorage.instance.ref();
  late String _profilImageID;
  @override
  Future<ProfilImageModel> changeProfilImage(
      {required ChangeProfilImageParams params}) async {
    RegExp search = RegExp(r'profilImage_.+\.jpg');
    var equal = search.firstMatch(params.profilImageUrl);
    String? imageName = equal?[0];
    UploadTask uploadTask = _profilStorageService
        .child("$kProfileImages/${params.userID}/$imageName")
        .putFile(
          params.profilImagePath,
        );
    TaskSnapshot snapshot = await uploadTask;
    String? imageURL = await snapshot.ref.getDownloadURL().onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
    return ProfilImageModel(profilImageUrl: imageURL);
  }

  @override
  Future<void> deleteProfilImage(
      {required DeleteProfilImageParams params}) async {
    RegExp search = RegExp(r'profilImage_.+\.jpg');
    var equal = search.firstMatch(params.profilImageUrl);
    String? imageName = equal?[0];
    if (imageName != null) {
      await _profilStorageService
          .child("$kProfileImages/${params.userID}/$imageName")
          .delete();
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<ProfilImageModel> addProfilImage(
      {required AddProfilImageParams params}) async {
    _profilImageID = const Uuid().v4();
    String imageName = "profilImage_$_profilImageID.jpg";
    UploadTask uploadTask = _profilStorageService
        .child("$kProfileImages/${params.userID}/$imageName")
        .putFile(
          params.profilImagePath,
        );
    TaskSnapshot snapshot = await uploadTask;
    String? imageURL = await snapshot.ref.getDownloadURL().onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
    return ProfilImageModel(profilImageUrl: imageURL);
  }
}
