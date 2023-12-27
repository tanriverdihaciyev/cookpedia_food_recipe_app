import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/user_detail_constants.dart';
import '../../domain/entities/user_detail_entity.dart';

DateTime dateTime = DateTime.now();

class UserDetailModel extends UserDetailEntity {
  const UserDetailModel({
    required String id,
    DateTime? createdDate,
    String? description,
    required String country,
    required String cookingLevel,
    required String gender,
    required DateTime dateOfBirth,
    Set<String>? cuisinesPrefs,
    Set<String>? diotaryPrefs,
    String? whatsApp,
    String? facebook,
    String? twitter,
    String? instagram,
    String? tiktok,
    String? web,
    String? adress,
    String? displayName,
  }) : super(
          id: id,
          country: country,
          cookingLevel: cookingLevel,
          gender: gender,
          dateOfBirth: dateOfBirth,
          adress: adress,
          cuisinesPrefs: cuisinesPrefs,
          diotaryPrefs: diotaryPrefs,
          facebook: facebook,
          instagram: instagram,
          tiktok: tiktok,
          twitter: twitter,
          web: web,
          whatsApp: whatsApp,
          createdDate: createdDate,
          description: description,
          displayName: displayName,
        );

  factory UserDetailModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserDetailModel(
      id: doc.id,
      cookingLevel: doc.data()?[kCookingLevel],
      country: doc.data()?[kCountry],
      cuisinesPrefs: (doc.data()?[kCuisinesPrefs] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      dateOfBirth: (doc.data()?[kDateOfBirth] as Timestamp).toDate(),
      diotaryPrefs: (doc.data()?[kDiotaryPrefs] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      gender: doc.data()?[kGender],
      adress: doc.data()?[kAdress],
      facebook: doc.data()?[kFacebook],
      instagram: doc.data()?[kInstagram],
      tiktok: doc.data()?[kTiktok],
      twitter: doc.data()?[kTwitter],
      web: doc.data()?[kWeb],
      whatsApp: doc.data()?[kWhatsApp],
      description: doc.data()?[kDescription],
      createdDate: (doc.data()?[kCreatedDate] as Timestamp?)?.toDate(),
      displayName: doc.data()?[kDisplayName],
    );
  }
  factory UserDetailModel.fromEntity(UserDetailEntity userDetailEntity) {
    return UserDetailModel(
      country: userDetailEntity.country,
      cookingLevel: userDetailEntity.cookingLevel,
      gender: userDetailEntity.gender,
      dateOfBirth: userDetailEntity.dateOfBirth,
      adress: userDetailEntity.adress,
      createdDate: userDetailEntity.createdDate,
      cuisinesPrefs: userDetailEntity.cuisinesPrefs,
      diotaryPrefs: userDetailEntity.diotaryPrefs,
      facebook: userDetailEntity.facebook,
      id: userDetailEntity.id,
      instagram: userDetailEntity.instagram,
      tiktok: userDetailEntity.tiktok,
      twitter: userDetailEntity.twitter,
      web: userDetailEntity.web,
      whatsApp: userDetailEntity.whatsApp,
      description: userDetailEntity.description,
      displayName: userDetailEntity.displayName,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      kCookingLevel: cookingLevel,
      kCountry: country,
      kCuisinesPrefs: cuisinesPrefs?.toList(),
      kDateOfBirth: dateOfBirth,
      kDiotaryPrefs: diotaryPrefs?.toList(),
      kGender: gender,
      kAdress: adress,
      kFacebook: facebook,
      kInstagram: instagram,
      kTiktok: tiktok,
      kTwitter: twitter,
      kWeb: web,
      kWhatsApp: whatsApp,
      kCreatedDate: dateTime,
      kDescription: description,
      kDisplayName: displayName,
    };
  }
}
