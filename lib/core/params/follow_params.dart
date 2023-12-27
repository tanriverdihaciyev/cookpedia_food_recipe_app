class FollowParams {
  final String activeUserId;
  final String otherUserId;

  FollowParams(this.activeUserId, this.otherUserId);
}

class FollowUserParams {
  final String userID;

  FollowUserParams({required this.userID});
}
