part of 'cubit.dart';

abstract class ValidationWithLoginState extends Equatable {
  const ValidationWithLoginState();

  @override
  List<Object> get props => [];
}

class ValidationWithLoginInitial extends ValidationWithLoginState {}

class ValidationWithLoginLoading extends ValidationWithLoginState {}

class ValidationWithLoginLoaded extends ValidationWithLoginState {
  final RequestTokenModel requestTokenModel;

  ValidationWithLoginLoaded(this.requestTokenModel);

  @override
  List<Object> get props => [requestTokenModel];
}

class ValidationWithLoginError extends ValidationWithLoginState {
  final String message;

  ValidationWithLoginError(this.message);

  @override
  List<Object> get props => [message];
}
