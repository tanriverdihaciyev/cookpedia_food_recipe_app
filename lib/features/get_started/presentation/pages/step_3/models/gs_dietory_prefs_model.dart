import 'package:equatable/equatable.dart';

class GSDietoryPrefsModel extends Equatable {
  final String title;
  final String image;

  const GSDietoryPrefsModel({required this.title, required this.image});

  @override
  List<Object?> get props => [title, image];
}
