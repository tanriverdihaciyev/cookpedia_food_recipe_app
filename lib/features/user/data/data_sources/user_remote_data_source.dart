import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/user_params.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser({required UserModel params});
  Future<void> updateUser({required UpdateUserParams params});

  Future<UserModel> getUser({required UserParams params});
  Future<List<UserModel>> getTopUser();
}

class FirebaseUserService implements UserRemoteDataSource {
  final _userService = FirebaseFirestore.instance;

  @override
  Future<void> createUser({required UserModel params}) async {
    await _userService
        .collection(kUsers)
        .doc(params.id)
        .set(params.toJson())
        .then((value) => null)
        .onError(
      (error, stackTrace) {
        throw FirebaseServerException();
      },
    );
  }

  @override
  Future<UserModel> getUser({required UserParams params}) async {
    final snap = await _userService.collection(kUsers).doc(params.id).get();
    if (snap.exists) {
      return UserModel.fromDoc(snap);
    } else {
      throw FirebaseServerException();
    }
  }

  @override
  Future<void> updateUser({required UpdateUserParams params}) async {
    await _userService
        .collection(kUsers)
        .doc(params.userID)
        .update({params.contentTitle: params.contentBody})
        .then((value) => null)
        .onError(
          (error, stackTrace) => throw FirebaseServerException(),
        );
  }

  @override
  Future<List<UserModel>> getTopUser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _userService.collection(kUsers).get().onError(
              (error, stackTrace) => throw FirebaseServerException(),
            );
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((e) => UserModel.fromDoc(e)).toList()
        ..sort(
          (a, b) => a.view!.compareTo(b.view!),
        );
    } else {
      throw FirebaseServerException();
    }
  }
}
