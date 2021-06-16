part of 'cubit.dart';

abstract class ValidationSessionState extends Equatable {
  const ValidationSessionState();

  @override
  List<Object> get props => [];
}

class ValidationSessionInitial extends ValidationSessionState {}

class ValidationSessionLoading extends ValidationSessionState {}

class ValidationSessionLoaded extends ValidationSessionState {
  final int session;

  ValidationSessionLoaded(this.session);

  @override
  List<Object> get props => [session];
}

class ValidationSessionError extends ValidationSessionState {
  final String message;

  ValidationSessionError(this.message);

  @override
  List<Object> get props => [message];
}
