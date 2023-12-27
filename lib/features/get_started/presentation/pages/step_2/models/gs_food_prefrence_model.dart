import 'package:equatable/equatable.dart';

class GSFoodPrefrenceModel extends Equatable {
  final String image;
  final String name;

  const GSFoodPrefrenceModel({required this.image, required this.name});

  @override
  List<Object> get props => [image, name];
}
