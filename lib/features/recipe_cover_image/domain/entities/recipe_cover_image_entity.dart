import 'package:equatable/equatable.dart';

class RecipeCoverImageEntity extends Equatable {
  final String imageURL;

  const RecipeCoverImageEntity({required this.imageURL});

  @override
  List<Object?> get props => [imageURL];
}
