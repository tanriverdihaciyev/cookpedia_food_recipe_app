import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/user_visit_params.dart';
import '../../data/data_sources/user_visit_remote_data_source.dart';
import '../../data/repositories/user_visit_repository_impl.dart';
import '../../domain/repositories/user_visit_repository.dart';
import '../../domain/usecases/add_user_visit_usecase.dart';

class UserVisitProvider extends ChangeNotifier {
  Failure? failure;
  eitherAddUserVisit({required UserVisitParams params}) async {
    final UserVisitRepository repository =
        UserVisitRepositoryImpl(UserVisitFireBase());
    final either = await AddUserVisitUseCase(repository).call(params);
    either.fold((l) {
      failure = l;
      notifyListeners();
    }, (r) {
      failure = null;
      notifyListeners();
    });
  }
}
