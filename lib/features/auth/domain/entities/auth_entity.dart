import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String email;
  final String? photoURL;
  final String? phoneNumber;
  final String? displayName;

  const AuthEntity({
    required this.id,
    this.photoURL,
    this.phoneNumber,
    this.displayName,
    required this.email,
  });

  @override
  List<Object?> get props => [id, email];
}
