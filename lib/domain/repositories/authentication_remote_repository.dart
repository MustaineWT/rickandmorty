import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';

abstract class AuthenticationRemoteRepository {
  Future<Either<Failure, List<RequestTokenModel>>> getValidationWithLogin(
      String username, String password);
}
