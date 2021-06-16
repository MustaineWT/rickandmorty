import 'package:dio/dio.dart';
import 'package:ecommers_app/core/utils/logs.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';

abstract class AuthenticationRemoteDataSources {
  Future<List<RequestTokenModel>> requestValidateWithLogin(
      String username, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSources {
  final Dio _dio;

  AuthenticationRemoteDataSourceImpl(this._dio);

  @override
  Future<List<RequestTokenModel>> requestValidateWithLogin(
      String username, String password) async {
    final response = await _dio.get(
      '/character',
      queryParameters: {"name": username, "status": password},
    );
    Logs.p.i(response.data['results']);
    return (response.data['results'] as List)
        .map((e) => RequestTokenModel.fromJson(e))
        .toList();
  }
}
