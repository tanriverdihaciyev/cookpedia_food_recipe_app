import 'package:equatable/equatable.dart';

class RecipeInstructionImageEntity extends Equatable {
  final String instructionImageURL;

  const RecipeInstructionImageEntity({
    required this.instructionImageURL,
  });

  @override
  List<Object?> get props => [
        instructionImageURL,
      ];
}
