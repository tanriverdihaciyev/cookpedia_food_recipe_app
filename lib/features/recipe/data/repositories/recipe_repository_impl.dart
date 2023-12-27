import 'package:cookpedia_foodrecipe_app/features/saved_recipes/domain/entities/saved_recipe_enitity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/recipe_params.dart';
import '../../domain/entities/recipe_entity.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../data_sources/recipe_remote_data_source.dart';
import '../models/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl(this._remoteDataSource);
  final RecipeRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, void>> createRecipe(
      {required RecipeEntity params}) async {
    try {
      await _remoteDataSource.createRecipe(
          params: RecipeModel.fromEntity(params));
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, RecipeEntity>> getRecipe(
      {required RecipeParams params}) async {
    try {
      final remoteRecipe = await _remoteDataSource.getRecipe(params: params);
      return Right(remoteRecipe);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getUserRecipes(
      {required RecipeUserParams params}) async {
    try {
      final remoteRecipes =
          await _remoteDataSource.getUserRecipes(params: params);
      return Right(remoteRecipes);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, void>> removeRecipe(
      {required RecipeParams params}) async {
    try {
      await _remoteDataSource.removeRecipe(params: params);
      return const Right(null);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, bool>> isRecipeExists(
      {required IsRecipeExistsParams params}) async {
    try {
      final remoteIsRecipeExists =
          await _remoteDataSource.isRecipeExists(params: params);
      return Right(remoteIsRecipeExists);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getMostPopularRecipes() async {
    try {
      final remoteRecipes = await _remoteDataSource.getMostPopularRecipes();
      return Right(remoteRecipes);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getRecentRecipes(
      {required RecentRecipeParams params}) async {
    try {
      final remoteRecipes =
          await _remoteDataSource.getRecentRecipes(params: params);
      return Right(remoteRecipes);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getSavedRecipes(
      {required List<SavedRecipeEntity> params}) async {
    try {
      final remoteRecipes =
          await _remoteDataSource.getSavedRecipes(params: params);
      return Right(remoteRecipes);
    } on FirebaseServerException {
      return Left(FirebaseFailure(message: "message", code: "code"));
    }
  }
}
