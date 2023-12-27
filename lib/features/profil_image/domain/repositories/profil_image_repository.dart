import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../entities/profil_image_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfilImageRepository {
  Future<Either<Failure, ProfilImageEntity>> addProfilImage(
      {required AddProfilImageParams params});
  Future<Either<Failure, void>> deleteProfilImage(
      {required DeleteProfilImageParams params});
  Future<Either<Failure, ProfilImageEntity>> changeProfilImage(
      {required ChangeProfilImageParams params});
}
