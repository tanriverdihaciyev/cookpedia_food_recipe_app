import 'dart:convert';

import 'package:cookpedia_foodrecipe_app/core/errors/exceptions.dart';
import 'package:cookpedia_foodrecipe_app/features/auth/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void>? cachedAuth({required AuthModel? params});
  Future<AuthModel> getLocalAuth();
}

const cacheAuth = "CACHE_AUTH";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void>? cachedAuth({required AuthModel? params}) async {
    if (params != null) {
      _sharedPreferences.setString(
        cacheAuth,
        json.encode(
          params.toJson(),
        ),
      );
    } else {
      _sharedPreferences.setString(cacheAuth, "");
      throw CachedException();
    }
  }

  @override
  Future<AuthModel> getLocalAuth() async {
    final jsonString = _sharedPreferences.getString(cacheAuth);
    if (jsonString != null && jsonString != "") {
      return AuthModel.fromJson(
        json.decode(jsonString),
      );
    } else {
      throw CachedException();
    }
  }
}
