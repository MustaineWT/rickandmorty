import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/repositories/authentication_remote_repository.dart';

class ValidationWithLogin {
  final AuthenticationRemoteRepository authenticationRemoteRepository;

  ValidationWithLogin(this.authenticationRemoteRepository);

  Future<Either<Failure, List<RequestTokenModel>>> call(
      String username, String password) async {
    return authenticationRemoteRepository.getValidationWithLogin(
        username, password);
  }
}
