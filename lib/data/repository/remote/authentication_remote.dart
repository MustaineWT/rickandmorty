import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/exceptions.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/datasources/local/authentication_local.dart';
import 'package:ecommers_app/data/datasources/remote/authentication_remote.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/entities/requestToken.dart';
import 'package:ecommers_app/domain/repositories/authentication_remote_repository.dart';

class AuthenticationRemoteRepositoryImpl
    implements AuthenticationRemoteRepository {
  final AuthenticationRemoteDataSources remoteDataSource;
  final AuthenticationLocalDataSources localDataSource;

  AuthenticationRemoteRepositoryImpl(
      this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<RequestTokenModel>>> getValidationWithLogin(
      String username, String password) async {
    try {
      final response =
          await remoteDataSource.requestValidateWithLogin(username, password);
      await localDataSource.setSession(response.first);
      return Right(response);
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
