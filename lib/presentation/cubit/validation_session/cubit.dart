import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/domain/usecases/auth_session/validation_with_session.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class ValidationWithSessionCubit extends Cubit<ValidationSessionState> {
  final ValidationWithSession validationWithSession;
  ValidationWithSessionCubit(this.validationWithSession)
      : super(ValidationSessionInitial());

  void getCubitValidationWithSession() async {
    emit(ValidationSessionLoading());
    await Future.delayed(Duration(seconds: 3));
    final failureOrLogin = await validationWithSession();
    emit(_eitherLoadedOrErrorState(failureOrLogin));
  }

  ValidationSessionState _eitherLoadedOrErrorState(
      Either<Failure, int> failureOrLoginSession) {
    return failureOrLoginSession.fold(
        (failure) => ValidationSessionError(_mapFailureToMessage(failure)),
        (session) => ValidationSessionLoaded(session));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return 'Ha ocurrido un error al obtener la session.';
      default:
        return 'Unexpected error';
    }
  }
}
