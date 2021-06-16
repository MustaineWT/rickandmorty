import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/exceptions.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/datasources/local/authentication_local.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/repositories/authentication_local_repository.dart';

class AuthenticationLocalRepositoryImpl
    implements AuthenticationLocalRepository {
  final AuthenticationLocalDataSources localDataSource;

  AuthenticationLocalRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, String>> clearSession() async {
    try {
      final response = await localDataSource.clearSession();
      return Right(response);
    } on LocalException {
      return Left(
        LocalFailure(message: 'Ha ocurrido un error al eliminar la sessión'),
      );
    }
  }

  @override
  Future<Either<Failure, int>> getSession() async {
    try {
      final response = await localDataSource.getSession();
      return Right(response);
    } on LocalException {
      return Left(
        LocalFailure(message: 'Ha ocurrido un error al obtener la sessión'),
      );
    }
  }

  @override
  Future<Either<Failure, RequestTokenModel>> getUserSession() async {
    try {
      final response = await localDataSource.getUserSession();
      return Right(response);
    } on LocalException {
      return Left(
        LocalFailure(
            message: 'Ha ocurrido un error al obtener la sessión del usuario'),
      );
    }
  }

  @override
  Future<Either<Failure, RequestTokenModel>> setSession(
      RequestTokenModel requestToken) async {
    try {
      final response = await localDataSource.setSession(requestToken);
      return Right(response);
    } on LocalException {
      return Left(
        LocalFailure(message: 'Ha ocurrido un error al guardar la sessión'),
      );
    }
  }
}
