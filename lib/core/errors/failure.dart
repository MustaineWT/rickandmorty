import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

//!* Main Failure of the Application
class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class LocalFailure extends Failure {
  LocalFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}

class CredentialException extends Failure {
  CredentialException({required String message}) : super(message: message);
}

class ErrorParametersException extends Failure {
  ErrorParametersException({required String message}) : super(message: message);
}

class ServerCancelException extends Failure {
  ServerCancelException({required String message}) : super(message: message);
}

class OthersException extends Failure {
  OthersException({required String message}) : super(message: message);
}

class SessionExpiredException extends Failure {
  SessionExpiredException({required String message}) : super(message: message);
}

class ConnectTimeOutException extends Failure {
  ConnectTimeOutException({required String message}) : super(message: message);
}

class UndefinedException extends Failure {
  UndefinedException({required String message}) : super(message: message);
}

class InternalServerErrorException extends Failure {
  InternalServerErrorException({required String message})
      : super(message: message);
}

class ServerOfflineException extends Failure {
  ServerOfflineException({required String message}) : super(message: message);
}
