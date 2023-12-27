import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/follow_params.dart';

abstract class FollowRemoteDataSource {
  Future<void> followUser({required FollowParams params});
  Future<void> unfollowUser({required FollowParams params});
  Future<bool> isFollowedUser({required FollowParams params});
  Future<int> getUserFollowed({required FollowUserParams params});
  Future<int> getUserFollowers({required FollowUserParams params});
}

class FollowFirebaseService implements FollowRemoteDataSource {
  final _followService = FirebaseFirestore.instance;

  @override
  Future<void> followUser({required FollowParams params}) async {
    return await _followService
        .collection(kFollowed)
        .doc(params.activeUserId)
        .collection(kUserFollowed)
        .doc(params.otherUserId)
        .set({}).then((_) {
      _followService
          .collection(kFollowers)
          .doc(params.otherUserId)
          .collection(kUserFollowers)
          .doc(params.activeUserId)
          .set({})
          .then((value) => null)
          .onError((error, stackTrace) {
            throw FirebaseServerException();
          });
    }).onError((error, stackTrace) {
      throw FirebaseServerException();
    });
  }

  @override
  Future<int> getUserFollowed({required FollowUserParams params}) async {
    final snap = await _followService
        .collection(kFollowed)
        .doc(params.userID)
        .collection(kUserFollowed)
        .get();
    if (snap.docs.isNotEmpty) {
      return snap.docs.length;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<int> getUserFollowers({required FollowUserParams params}) async {
    final snap = await _followService
        .collection(kFollowers)
        .doc(params.userID)
        .collection(kUserFollowers)
        .get();
    if (snap.docs.isNotEmpty) {
      return snap.docs.length;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<bool> isFollowedUser({required FollowParams params}) async {
    final snap = await _followService
        .collection(kFollowed)
        .doc(params.activeUserId)
        .collection(kUserFollowed)
        .doc(params.otherUserId)
        .get();
    if (snap.exists) {
      return true;
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> unfollowUser({required FollowParams params}) async {
    return await _followService
        .collection(kFollowed)
        .doc(params.activeUserId)
        .collection(kUserFollowed)
        .doc(params.otherUserId)
        .delete()
        .then((_) {
      _followService
          .collection(kFollowers)
          .doc(params.otherUserId)
          .collection(kUserFollowers)
          .doc(params.activeUserId)
          .delete()
          .then((value) => null)
          .onError((error, stackTrace) {
        throw FirebaseServerException();
      });
    }).onError((error, stackTrace) {
      throw FirebaseServerException();
    });
  }
}
