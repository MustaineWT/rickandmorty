import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/domain/repositories/authentication_local_repository.dart';

class ValidationWithSession {
  final AuthenticationLocalRepository authenticationLocalRepository;

  ValidationWithSession(this.authenticationLocalRepository);

  Future<Either<Failure, int>> call() async {
    return authenticationLocalRepository.getSession();
  }
}
