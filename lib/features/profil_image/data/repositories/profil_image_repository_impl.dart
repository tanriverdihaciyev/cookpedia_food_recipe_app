import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/profil_image_params.dart';
import '../data_sources/profil_image_remote_data_source.dart';
import '../../domain/entities/profil_image_entity.dart';
import '../../domain/repositories/profil_image_repository.dart';
import 'package:dartz/dartz.dart';

class ProfilImageRepositoryImpl implements ProfilImageRepository {
  final ProfilImageRemoteDataSource _remoteDataSource;

  ProfilImageRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, ProfilImageEntity>> changeProfilImage(
      {required ChangeProfilImageParams params}) async {
    try {
      final remoteProfilImage =
          await _remoteDataSource.changeProfilImage(params: params);
      return Right(remoteProfilImage);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfilImage(
      {required DeleteProfilImageParams params}) async {
    try {
      final remoteDeleteProfilImage =
          await _remoteDataSource.deleteProfilImage(params: params);
      return Right(remoteDeleteProfilImage);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }

  @override
  Future<Either<Failure, ProfilImageEntity>> addProfilImage(
      {required AddProfilImageParams params}) async {
    try {
      final remoteProfilImage =
          await _remoteDataSource.addProfilImage(params: params);
      return Right(remoteProfilImage);
    } on FirebaseServerException {
      return Left(
        FirebaseFailure(message: "message", code: "code"),
      );
    }
  }
}
