import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookpedia_foodrecipe_app/core/constants/recipe_constants.dart';

import '../../../../core/constants/user_constants.dart';
import '../../../auth/domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    String? profileImage,
    String? fullName,
    String? phoneNumber,
    String? userName,
    int? view,
    required String email,
  }) : super(
          email: email,
          fullName: fullName,
          id: id,
          phoneNumber: phoneNumber,
          profileImage: profileImage,
          userName: userName,
          view: view,
        );

  factory UserModel.fromAuth(AuthEntity auth) {
    return UserModel(
      id: auth.id,
      email: auth.email,
      userName: auth.email,
      fullName: auth.displayName,
      phoneNumber: auth.phoneNumber,
      profileImage: auth.photoURL,
    );
  }
  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      id: doc.id,
      email: doc.data()?[kEmail],
      fullName: doc.data()?[kFullName],
      phoneNumber: doc.data()?[kPhoneNumber],
      profileImage: doc.data()?[kProfileImage],
      userName: doc.data()?[kUserName],
      view: doc.data()?[kView],
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      fullName: userEntity.fullName,
      phoneNumber: userEntity.phoneNumber,
      profileImage: userEntity.profileImage,
      userName: userEntity.userName,
      view: userEntity.view,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      kProfileImage: profileImage,
      kFullName: fullName,
      kPhoneNumber: phoneNumber,
      kUserName: userName,
      kEmail: email,
      kView: 0,
    };
  }
}
