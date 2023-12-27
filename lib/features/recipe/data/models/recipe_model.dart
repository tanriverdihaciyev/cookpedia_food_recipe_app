import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/recipe_constants.dart';
import '../../domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    String? id,
    required String sharedUserId,
    required String cookTime,
    required List<String> coverImages,
    required String description,
    required List<String> ingredients,
    required List<InstructionModel> instructions,
    required String origin,
    required String serves,
    required String title,
    required bool isPublishedRecipe,
    int? view,
    DateTime? createdDate,
  }) : super(
            view: view,
            isPublishedRecipe: isPublishedRecipe,
            id: id,
            sharedUserId: sharedUserId,
            cookTime: cookTime,
            coverImages: coverImages,
            description: description,
            ingredients: ingredients,
            instructions: instructions,
            origin: origin,
            serves: serves,
            title: title,
            createdDate: createdDate);

  Map<String, dynamic> toJson() => {
        kView: 0,
        kSharedUserId: sharedUserId,
        kCoverImage: coverImages,
        kTitle: title,
        kDescription: description,
        kCookTime: cookTime,
        kServes: serves,
        kOrigin: origin,
        kIngredients: ingredients,
        kIsPublishedRecipe: isPublishedRecipe,
        kCreatedDate: DateTime.now(),
        kInstructions: instructions.map(
          (InstructionEntity e) => (e as InstructionModel).toJson(),
        ),
      };

  factory RecipeModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return RecipeModel(
      view: doc.data()?[kView],
      isPublishedRecipe: doc.data()![kIsPublishedRecipe],
      id: doc.id,
      sharedUserId: doc.data()![kSharedUserId],
      cookTime: doc.data()![kCookTime],
      coverImages: (doc.data()![kCoverImage] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: doc.data()![kDescription],
      ingredients: (doc.data()![kIngredients] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      instructions: (doc.data()![kInstructions] as List<dynamic>)
          .map((e) => InstructionModel.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.id.compareTo(b.id)),
      origin: doc.data()![kOrigin],
      serves: doc.data()![kServes],
      title: doc.data()![kTitle],
      createdDate: (doc.data()?[kCreatedDate] as Timestamp?)?.toDate(),
    );
  }

  factory RecipeModel.fromEntity(RecipeEntity recipeEntity) {
    return RecipeModel(
      view: recipeEntity.view,
      sharedUserId: recipeEntity.sharedUserId,
      cookTime: recipeEntity.cookTime,
      coverImages: recipeEntity.coverImages,
      description: recipeEntity.description,
      ingredients: recipeEntity.ingredients,
      instructions: recipeEntity.instructions
          .map((e) => InstructionModel.fromEntity(e))
          .toList(),
      origin: recipeEntity.origin,
      serves: recipeEntity.serves,
      title: recipeEntity.title,
      isPublishedRecipe: recipeEntity.isPublishedRecipe,
      createdDate: recipeEntity.createdDate,
    );
  }
}

class InstructionModel extends InstructionEntity {
  const InstructionModel({
    required int id,
    required String image1,
    required String image2,
    required String image3,
    required String instruction,
  }) : super(
          id: id,
          image1: image1,
          image2: image2,
          image3: image3,
          instruction: instruction,
        );

  Map<String, dynamic> toJson() {
    return {
      kInstructionID: id,
      kInstruction: instruction,
      kImage1: image1,
      kImage2: image2,
      kImage3: image3,
    };
  }

  factory InstructionModel.fromJson(Map<String, dynamic> json) =>
      InstructionModel(
        id: json[kInstructionID],
        image1: json[kImage1] as String,
        image2: json[kImage2] as String,
        image3: json[kImage3] as String,
        instruction: json[kInstruction] as String,
      );

  factory InstructionModel.fromEntity(InstructionEntity e) {
    return InstructionModel(
      id: e.id,
      image1: e.image1,
      image2: e.image2,
      image3: e.image3,
      instruction: e.instruction,
    );
  }
}
