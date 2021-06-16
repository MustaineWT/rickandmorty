import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';

abstract class AuthenticationLocalRepository {
  Future<Either<Failure, String>> clearSession();
  Future<Either<Failure, int>> getSession();
  Future<Either<Failure, RequestTokenModel>> getUserSession();
  Future<Either<Failure, RequestTokenModel>> setSession(
      RequestTokenModel requestToken);
}
