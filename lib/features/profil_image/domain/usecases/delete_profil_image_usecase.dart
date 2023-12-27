import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/profil_image_repository.dart';

class DeleteProfilImageUseCase
    extends UseCase<Either<Failure, void>, DeleteProfilImageParams> {
  final ProfilImageRepository _repository;

  DeleteProfilImageUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(DeleteProfilImageParams params) async {
    return _repository.deleteProfilImage(params: params);
  }
}
