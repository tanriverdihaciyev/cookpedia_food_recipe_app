import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profil_image_entity.dart';
import '../repositories/profil_image_repository.dart';

class ChangeProfilImageUseCase extends UseCase<
    Either<Failure, ProfilImageEntity>, ChangeProfilImageParams> {
  final ProfilImageRepository _repository;

  ChangeProfilImageUseCase(this._repository);
  @override
  Future<Either<Failure, ProfilImageEntity>> call(
      ChangeProfilImageParams params) async {
    return _repository.changeProfilImage(params: params);
  }
}
