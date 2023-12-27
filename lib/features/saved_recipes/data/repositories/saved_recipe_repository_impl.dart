import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/saved_recipe_params.dart';
import '../../domain/entities/saved_recipe_enitity.dart';
import '../../domain/repositories/saved_recipe_repository.dart';
import '../data_sources/saved_recipe_remote_data_source.dart';

class SavedRecipeRepositoryImpl implements SavedRecipeRepository {
  final SavedRecipeRemoteDataSource _remoteDataSource;

  SavedRecipeRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<SavedRecipeEntity>>> getSavedRecipes(
      {required GetSaveRecipesParams params}) async {
    try {
      final remoteSavedRecipes =
          await _remoteDataSource.getSavedRecipes(params: params);
      return Right(remoteSavedRecipes);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, bool>> isSavedRecipe(
      {required SavedRecipeParams params}) async {
    try {
      final remoteIsSavedRecipe =
          await _remoteDataSource.isSavedRecipe(params: params);
      return Right(remoteIsSavedRecipe);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> saveRecipe(
      {required SavedRecipeParams params}) async {
    try {
      final remoteSaveRecipe =
          await _remoteDataSource.saveRecipe(params: params);
      return Right(remoteSaveRecipe);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> unSaveRecipe(
      {required SavedRecipeParams params}) async {
    try {
      final remoteUnSaveRecipe =
          await _remoteDataSource.unSaveRecipe(params: params);
      return Right(remoteUnSaveRecipe);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
