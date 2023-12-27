import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../data/data_sources/profil_image_remote_data_source.dart';
import '../../data/repositories/profil_image_repository_impl.dart';
import '../../domain/entities/profil_image_entity.dart';
import '../../domain/repositories/profil_image_repository.dart';
import '../../domain/usecases/add_profil_image_usecase.dart';
import '../../domain/usecases/change_profil_image_usecase.dart';
import '../../domain/usecases/delete_profil_image_usecase.dart';

class ProfilImageProvider extends ChangeNotifier {
  ProfilImageEntity? profilImageEntity;
  Failure? failure;

  Future<void> eitherAddProfilImage(
      {required AddProfilImageParams params}) async {
    final ProfilImageRepository repository =
        ProfilImageRepositoryImpl(ProfilImageFireStorageService());
    final eitherProfilImageOrFailure =
        await AddProfilImageUseCase(repository).call(params);
    eitherProfilImageOrFailure.fold((l) {
      profilImageEntity = null;
      failure = l;
      notifyListeners();
    }, (r) {
      profilImageEntity = r;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherChangeProfilImage(
      {required ChangeProfilImageParams params}) async {
    final ProfilImageRepository repository =
        ProfilImageRepositoryImpl(ProfilImageFireStorageService());
    final eitherProfilImageOrFailure =
        await ChangeProfilImageUseCase(repository).call(params);
    eitherProfilImageOrFailure.fold((l) {
      profilImageEntity = null;
      failure = l;
      notifyListeners();
    }, (r) {
      profilImageEntity = r;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherDeleteProfilImage(
      {required DeleteProfilImageParams params}) async {
    final ProfilImageRepository repository =
        ProfilImageRepositoryImpl(ProfilImageFireStorageService());
    final eitherProfilImageOrFailure =
        await DeleteProfilImageUseCase(repository).call(params);
    eitherProfilImageOrFailure.fold((l) {
      profilImageEntity = null;
      failure = l;
      notifyListeners();
    }, (r) {
      profilImageEntity = null;
      failure = null;
      notifyListeners();
    });
  }
}
