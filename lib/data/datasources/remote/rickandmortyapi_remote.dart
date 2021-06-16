import 'package:dio/dio.dart';
import 'package:ecommers_app/core/utils/logs.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';

abstract class RickAndMortyApuRemoteDataSources {
  Future<RickAndMortyApi> requestCharacters();
}

class RickAndMortyApuRemoteDataSourceImpl
    implements RickAndMortyApuRemoteDataSources {
  final Dio _dio;

  RickAndMortyApuRemoteDataSourceImpl(this._dio);

  @override
  Future<RickAndMortyApi> requestCharacters() async {
    final response = await _dio.get(
      '/character',
    );
    Logs.p.i(response.data);
    return RickAndMortyApi.fromJson(response.data);
  }
}
