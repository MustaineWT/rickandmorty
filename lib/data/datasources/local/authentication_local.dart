import 'dart:convert';

import 'package:ecommers_app/core/utils/logs.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const KEY = "session";

abstract class AuthenticationLocalDataSources {
  Future<String> clearSession();
  Future<int> getSession();
  Future<RequestTokenModel> getUserSession();
  Future<RequestTokenModel> setSession(RequestTokenModel requestToken);
  Future<void> requestLogoutSession();
}

class AuthenticationLocalDataSourcesImpl
    implements AuthenticationLocalDataSources {
  final SharedPreferences _preferences;
  AuthenticationLocalDataSourcesImpl(this._preferences);

  static const KEY = "session";
  @override
  Future<String> clearSession() async {
    await _preferences.remove(KEY);

    return 'removido';
  }

  @override
  Future<int> getSession() async {
    final String? data = _preferences.get(KEY) as String?;
    Logs.p.i(data);
    if (data != null) {
      final requestToken = RequestTokenModel.fromJson(jsonDecode(data));
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = requestToken.created;
      final int expiresIn = 3600;
      final int diff = currentDate.difference(createdAt).inSeconds;

      if (expiresIn - diff >= 30) {
        return 1;
      } else {
        return 0;
      }
    }
    return 2;
  }

  @override
  Future<RequestTokenModel> getUserSession() async {
    final String data = _preferences.get(KEY) as String;
    final RequestTokenModel requestToken =
        requestTokenModelFromJson(jsonDecode(data));
    return requestToken;
  }

  @override
  Future<RequestTokenModel> setSession(RequestTokenModel requestToken) async {
    await _preferences.setString(KEY, jsonEncode(requestToken.toJson()));
    Logs.p.i(requestToken);
    return requestToken;
  }

  @override
  Future<void> requestLogoutSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.clear();
  }
}
