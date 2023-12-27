import 'dart:io';

class AddProfilImageParams {
  final String userID;
  final File profilImagePath;

  AddProfilImageParams({
    required this.userID,
    required this.profilImagePath,
  });
}

class DeleteProfilImageParams {
  final String userID;
  final String profilImageUrl;

  DeleteProfilImageParams({
    required this.userID,
    required this.profilImageUrl,
  });
}

class ChangeProfilImageParams {
  final String userID;
  final String profilImageUrl;
  final File profilImagePath;

  ChangeProfilImageParams({
    required this.userID,
    required this.profilImageUrl,
    required this.profilImagePath,
  });
}
