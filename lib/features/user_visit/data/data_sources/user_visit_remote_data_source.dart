import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookpedia_foodrecipe_app/core/constants/firebase_constants.dart';
import 'package:cookpedia_foodrecipe_app/core/errors/exceptions.dart';

import '../../../../core/params/user_visit_params.dart';

abstract class UserVisitRemoteDataSource {
  Future<void> addUserVisit({required UserVisitParams params});
}

class UserVisitFireBase implements UserVisitRemoteDataSource {
  final _userVisitFireBase = FirebaseFirestore.instance.collection(kUserVisits);
  @override
  Future<void> addUserVisit({required UserVisitParams params}) async {
    await _userVisitFireBase
        .doc(params.visitUserId)
        .collection(kVisitors)
        .doc(params.activeUserId)
        .set({})
        .then((value) => null)
        .onError((error, stackTrace) => throw FirebaseServerException());
  }
}
