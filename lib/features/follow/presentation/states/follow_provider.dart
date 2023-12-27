import '../../domain/usecases/follow_user.dart';
import '../../domain/usecases/unfollow_user.dart';

import '../../domain/usecases/get_followers.dart';
import '../../domain/usecases/is_followed.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/follow_params.dart';
import '../../data/data_sources/follow_remote_data_source.dart';
import '../../data/repositories/follow_repository_impl.dart';
import '../../domain/repositories/follow_repository.dart';
import '../../domain/usecases/get_followed.dart';

class FollowProvider extends ChangeNotifier {
  int? userFollowed;
  Failure? followedFailure;

  int? userFollowers;
  Failure? followersFailure;

  int? otherUserFollowed;
  Failure? otherUserFollowedFailure;
  int? otherUserFollowers;
  Failure? otherUserFollowersFailure;

  bool? isFollowedUser;
  Failure? isFollowedFailure;

  Failure? followUserFailure;
  Failure? unFollowUserFailure;
  void resetAll() {
    userFollowed = null;
    followedFailure = null;
    userFollowers = null;
    followersFailure = null;
    isFollowedUser = null;
    isFollowedFailure = null;
    notifyListeners();
  }

  Future<void> eitherUserFollowedOrFailure(
      {required FollowUserParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowedOrFailure = await GetFollowed(repository).call(params);

    eitherFollowedOrFailure.fold(
      (Failure newFollowedFailure) {
        followedFailure = newFollowedFailure;
        userFollowed = null;
        notifyListeners();
      },
      (int newUserFollowed) {
        followedFailure = null;
        userFollowed = newUserFollowed;
        notifyListeners();
      },
    );
  }

  Future<void> eitherUserFollowersOrFailure(
      {required FollowUserParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowersOrFailure =
        await GetFollowers(repository).call(params);

    eitherFollowersOrFailure.fold(
      (Failure newFollowersFailure) {
        followersFailure = newFollowersFailure;
        userFollowers = null;
        notifyListeners();
      },
      (int newUserFollowed) {
        followersFailure = null;
        userFollowers = newUserFollowed;
        notifyListeners();
      },
    );
  }

  Future<void> eitherOtherUserFollowedOrFailure(
      {required FollowUserParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowedOrFailure = await GetFollowed(repository).call(params);

    eitherFollowedOrFailure.fold(
      (Failure newFollowedFailure) {
        otherUserFollowedFailure = newFollowedFailure;
        otherUserFollowed = null;
        notifyListeners();
      },
      (int newUserFollowed) {
        otherUserFollowedFailure = null;
        otherUserFollowed = newUserFollowed;
        notifyListeners();
      },
    );
  }

  Future<void> eitherOtherUserFollowersOrFailure(
      {required FollowUserParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowersOrFailure =
        await GetFollowers(repository).call(params);

    eitherFollowersOrFailure.fold(
      (Failure newFollowersFailure) {
        otherUserFollowersFailure = newFollowersFailure;
        otherUserFollowers = null;
        notifyListeners();
      },
      (int newUserFollowed) {
        otherUserFollowersFailure = null;
        otherUserFollowers = newUserFollowed;
        notifyListeners();
      },
    );
  }

  Future<void> eitherIsFollowedOrFailure({required FollowParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowersOrFailure =
        await IsFollowUser(repository).call(params);

    eitherFollowersOrFailure.fold(
      (Failure newIsFollowedFailure) {
        isFollowedFailure = newIsFollowedFailure;
        isFollowedUser = null;
        notifyListeners();
      },
      (bool newIsFollowedUser) {
        isFollowedFailure = null;
        isFollowedUser = newIsFollowedUser;
        notifyListeners();
      },
    );
  }

  Future<void> eitherFollowUserOrFailure({required FollowParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowersOrFailure = await FollowUser(repository).call(params);

    eitherFollowersOrFailure.fold(
      (Failure newIsFollowedFailure) {
        followUserFailure = newIsFollowedFailure;
        notifyListeners();
      },
      (void newIsFollowedUser) {
        followUserFailure = null;
        notifyListeners();
      },
    );
  }

  Future<void> eitherUnFollowUserOrFailure(
      {required FollowParams params}) async {
    FollowRepository repository = FollowRepositoryImpl(FollowFirebaseService());

    final eitherFollowersOrFailure =
        await UnfollowUser(repository).call(params);

    eitherFollowersOrFailure.fold(
      (Failure newIsFollowedFailure) {
        unFollowUserFailure = newIsFollowedFailure;
        notifyListeners();
      },
      (void newIsFollowedUser) {
        unFollowUserFailure = null;
        notifyListeners();
      },
    );
  }
}
