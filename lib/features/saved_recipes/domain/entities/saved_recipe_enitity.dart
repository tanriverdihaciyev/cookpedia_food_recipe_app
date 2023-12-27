import 'package:equatable/equatable.dart';

class SavedRecipeEntity extends Equatable {
  final String savedRecipeID;

  const SavedRecipeEntity({required this.savedRecipeID});

  @override
  List<Object?> get props => [savedRecipeID];
}
