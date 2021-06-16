import 'package:ecommers_app/domain/usecases/rickandmorty_api/rickandmorty_characters.dart';
import 'package:ecommers_app/presentation/cubit/rickandmorty_characters/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local/authentication_local.dart';
import 'data/datasources/remote/authentication_remote.dart';
import 'data/datasources/remote/rickandmortyapi_remote.dart';
import 'data/repository/local/authentication_local.dart';
import 'data/repository/remote/authentication_remote.dart';
import 'data/repository/remote/rickandmorty_remote.dart';
import 'domain/repositories/authentication_local_repository.dart';
import 'domain/repositories/authentication_remote_repository.dart';
import 'domain/repositories/rickandmorty_remote_reposiroty.dart';
import 'domain/usecases/auth_session/validation_with_session.dart';
import 'domain/usecases/authentication/validation_with_login.dart';
import 'presentation/cubit/validation_session/cubit.dart';
import 'presentation/cubit/validation_with_login/cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initDependency();
}

Future<void> initDependency() async {
  BaseOptions options = new BaseOptions(
    baseUrl: "https://rickandmortyapi.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  //!* Dependencys Injections Apis.
  Dio dio = new Dio(options);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //!* Main Features Applications
  // Cubit
  sl.registerFactory(() => ValidationWithLoginCubit(sl()));
  sl.registerFactory(() => ValidationWithSessionCubit(sl()));
  sl.registerFactory(() => RickandmortyCharactersCubit(sl()));

  // use cases
  sl.registerLazySingleton(() => ValidationWithLogin(sl()));
  sl.registerLazySingleton(() => ValidationWithSession(sl()));
  sl.registerLazySingleton(() => RickAndMortyCharacters(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRemoteRepository>(
      () => AuthenticationRemoteRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<AuthenticationLocalRepository>(
      () => AuthenticationLocalRepositoryImpl(sl()));

  sl.registerLazySingleton<RickAndMortyApiRemoteRepository>(
      () => RickAndMortyApiRemoteRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSources>(
      () => AuthenticationRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AuthenticationLocalDataSources>(
      () => AuthenticationLocalDataSourcesImpl(sl()));

  sl.registerLazySingleton<RickAndMortyApuRemoteDataSources>(
      () => RickAndMortyApuRemoteDataSourceImpl(sl()));

  //! External
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => prefs);
}
