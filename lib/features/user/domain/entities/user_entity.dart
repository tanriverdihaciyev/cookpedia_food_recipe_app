import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? profileImage;
  final String? fullName;
  final String? phoneNumber;
  final String? userName;
  final String email;
  final int? view;

  const UserEntity({
    required this.id,
    this.view,
    this.profileImage,
    this.fullName,
    this.phoneNumber,
    this.userName,
    required this.email,
  });

  @override
  List<Object?> get props => [id, email];
}
