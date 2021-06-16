import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/requestToken_model.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/usecases/authentication/validation_with_login.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class ValidationWithLoginCubit extends Cubit<ValidationWithLoginState> {
  final ValidationWithLogin validationWithLogin;
  ValidationWithLoginCubit(this.validationWithLogin)
      : super(ValidationWithLoginInitial());

  String _username = '';
  String _password = '';

  void usernameChanged(String username) {
    _username = username;
  }

  void passwordChanged(String password) {
    _password = password;
  }

  void loginValidationWithLogin() async {
    emit(ValidationWithLoginLoading());
    await Future.delayed(Duration(seconds: 3));
    final failureOrLogin = await validationWithLogin(_username, _password);
    emit(_eitherLoadedOrErrorState(failureOrLogin));
  }

  bool _vPass = true;

  ValidationWithLoginState _eitherLoadedOrErrorState(
      Either<Failure, List<RequestTokenModel>> failureOrLoginSession) {
    return failureOrLoginSession.fold(
        (failure) => ValidationWithLoginError(_mapFailureToMessage(failure)),
        (login) => ValidationWithLoginLoaded(login.first));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Unexpected error';
    }
  }

  viewPass() {
    _vPass = !_vPass;
  }
}
