import 'package:cookpedia_foodrecipe_app/core/constants/auth_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String id,
    required String email,
    String? phoneNumber,
    String? photoURL,
    String? displayName,
  }) : super(
          id: id,
          email: email,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          displayName: displayName,
        );

  factory AuthModel.fromUser(User user) {
    return AuthModel(
      id: user.uid,
      email: user.email!,
      displayName: user.displayName,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
  }
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json[kId],
      email: json[kEmail],
      displayName: json[kDisplayName],
      phoneNumber: json[kPhoneNumber],
      photoURL: json[kPhotoURL],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      kId: id,
      kEmail: email,
      kPhoneNumber: phoneNumber,
      kPhotoURL: photoURL,
      kDisplayName: displayName,
    };
  }
}
