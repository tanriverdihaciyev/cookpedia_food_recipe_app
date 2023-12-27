import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/user_detail_params.dart';
import '../models/user_detail_model.dart';

abstract class UserDetailRemoteDataSource {
  Future<void> createUserDetail({required UserDetailModel params});
  Future<UserDetailModel> getUserDetail({required UserDetailParams params});
  Future<void> updateUserDetail({required UpdateUserDetailParams params});
}

class UserDetailFirebaseService implements UserDetailRemoteDataSource {
  final _userDetailService = FirebaseFirestore.instance;

  @override
  Future<void> createUserDetail({required UserDetailModel params}) async {
    await _userDetailService
        .collection(kUserDetails)
        .doc(params.id)
        .set(params.toJson())
        .then((value) => null)
        .onError((error, stackTrace) {
      throw FirebaseServerException();
    });
  }

  @override
  Future<UserDetailModel> getUserDetail(
      {required UserDetailParams params}) async {
    final snap =
        await _userDetailService.collection(kUserDetails).doc(params.id).get();
    if (snap.exists) {
      return UserDetailModel.fromDoc(snap);
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> updateUserDetail(
      {required UpdateUserDetailParams params}) async {
    await _userDetailService
        .collection(kUserDetails)
        .doc(params.userID)
        .update({params.contentTitle: params.contentBody})
        .then((value) => null)
        .onError((error, stackTrace) {
          throw FirebaseServerException();
        });
  }
}
