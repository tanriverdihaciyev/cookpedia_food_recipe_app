class UserDetailParams {
  final String id;

  UserDetailParams({required this.id});
}

class UpdateUserDetailParams {
  final String userID;
  final String contentTitle;
  final String? contentBody;

  UpdateUserDetailParams(
      {required this.userID,
      required this.contentTitle,
      required this.contentBody});
}
