import 'package:equatable/equatable.dart';

class ProfilImageEntity extends Equatable {
  final String profilImageUrl;

  const ProfilImageEntity({required this.profilImageUrl});

  @override
  List<Object?> get props => [profilImageUrl];
}
