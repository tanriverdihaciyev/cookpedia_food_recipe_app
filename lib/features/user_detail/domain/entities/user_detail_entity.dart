import 'package:equatable/equatable.dart';

class UserDetailEntity extends Equatable {
  final String id;
  final String country;
  final String cookingLevel;
  final String? description;
  final String gender;
  final DateTime? createdDate;
  final String? displayName;
  final DateTime dateOfBirth;
  final Set<String>? cuisinesPrefs;
  final Set<String>? diotaryPrefs;
  final String? whatsApp;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? tiktok;
  final String? web;
  final String? adress;

  const UserDetailEntity({
    this.displayName,
    this.description,
    this.createdDate,
    required this.id,
    this.whatsApp,
    this.facebook,
    this.twitter,
    this.instagram,
    this.tiktok,
    this.web,
    this.adress,
    this.cuisinesPrefs,
    this.diotaryPrefs,
    required this.country,
    required this.cookingLevel,
    required this.gender,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [id];
}
