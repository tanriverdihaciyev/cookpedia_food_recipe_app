import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../data/data_sources/user_detail_remote_data_source.dart';
import '../../data/repositories/user_detail_repository_impl.dart';
import '../../domain/entities/user_detail_entity.dart';
import '../../domain/repositories/user_detail_repository.dart';
import '../../domain/usecases/create_user_detail.dart';
import '../../domain/usecases/get_user_detail.dart';
import '../../domain/usecases/update_user_detail.dart';

class UserDetailProvider extends ChangeNotifier {
  UserDetailEntity? userDetail;
  Failure? failure;
  UserDetailEntity? otherUserDetail;
  Failure? otherUserfailure;
  Failure? updateFailure;
  void resetOtherUser() {
    otherUserDetail = null;
    otherUserfailure = null;
    notifyListeners();
  }

  Future<void> eitherCreateUserDetailVoidOrFailure(
      {required UserDetailEntity params}) async {
    UserDetailRepository repository =
        UserDetailRepositoryImpl(UserDetailFirebaseService());
    final eitherVoidOrFailure = await CreateUserDetail(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      userDetail = null;
      failure = newFailure;
      notifyListeners();
    }, (void result) {
      userDetail = null;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherUpdateUserDetailVoidOrFailure(
      {required UpdateUserDetailParams params}) async {
    UserDetailRepository repository =
        UserDetailRepositoryImpl(UserDetailFirebaseService());
    final eitherVoidOrFailure = await UpdateUserDetail(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      updateFailure = newFailure;
      notifyListeners();
    }, (void result) {
      updateFailure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetUserDetailVoidOrFailure(
      {required UserDetailParams params}) async {
    UserDetailRepository repository =
        UserDetailRepositoryImpl(UserDetailFirebaseService());
    final eitherVoidOrFailure = await GetUserDetail(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      userDetail = null;
      failure = newFailure;
      notifyListeners();
    }, (UserDetailEntity newUserDetail) {
      userDetail = newUserDetail;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> eitherGetOtherUserDetailVoidOrFailure(
      {required UserDetailParams params}) async {
    UserDetailRepository repository =
        UserDetailRepositoryImpl(UserDetailFirebaseService());
    final eitherVoidOrFailure = await GetUserDetail(repository).call(params);

    eitherVoidOrFailure.fold((Failure newFailure) {
      otherUserDetail = null;
      otherUserfailure = newFailure;
      notifyListeners();
    }, (UserDetailEntity newUserDetail) {
      otherUserDetail = newUserDetail;
      otherUserfailure = null;
      notifyListeners();
    });
  }
}
