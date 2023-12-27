class UserParams {
  final String id;

  UserParams({required this.id});
}

class UpdateUserParams {
  final String userID;
  final String contentTitle;
  final String? contentBody;

  UpdateUserParams({
    required this.userID,
    required this.contentTitle,
    required this.contentBody,
  });
}
