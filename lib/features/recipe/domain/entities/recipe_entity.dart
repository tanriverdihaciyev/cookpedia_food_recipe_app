import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? id;
  final String sharedUserId;
  final List<String> coverImages;
  final String title;
  final String description;
  final String cookTime;
  final String serves;
  final String origin;
  final List<String> ingredients;
  final List<InstructionEntity> instructions;
  final bool isPublishedRecipe;
  final int? view;
  final DateTime? createdDate;

  const RecipeEntity({
    this.createdDate,
    this.view,
    required this.isPublishedRecipe,
    this.id,
    required this.sharedUserId,
    required this.coverImages,
    required this.title,
    required this.description,
    required this.cookTime,
    required this.serves,
    required this.origin,
    required this.ingredients,
    required this.instructions,
  });

  @override
  List<Object?> get props => [id];
}

class InstructionEntity extends Equatable {
  final int id;
  final String instruction;
  final String image1;
  final String image2;
  final String image3;

  const InstructionEntity(
      {required this.id,
      required this.instruction,
      required this.image1,
      required this.image2,
      required this.image3});

  @override
  List<Object?> get props => [id];
}
