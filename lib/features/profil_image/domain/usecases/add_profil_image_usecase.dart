import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profil_image_entity.dart';
import '../repositories/profil_image_repository.dart';
import 'package:dartz/dartz.dart';

class AddProfilImageUseCase
    extends UseCase<Either<Failure, ProfilImageEntity>, AddProfilImageParams> {
  final ProfilImageRepository _repository;

  AddProfilImageUseCase(this._repository);
  @override
  Future<Either<Failure, ProfilImageEntity>> call(
      AddProfilImageParams params) async {
    return _repository.addProfilImage(params: params);
  }
}
