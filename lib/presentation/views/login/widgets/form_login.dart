import 'package:ecommers_app/presentation/cubit/validation_with_login/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_login.dart';
import 'textfield_password.dart';
import 'textfield_username.dart';

// ignore: must_be_immutable
class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _formLogin(context, size);
  }

  _formLogin(BuildContext context, Size size) {
    return Column(
      children: [
        TextFieldUserName(
            onChangedUserName:
                context.read<ValidationWithLoginCubit>().usernameChanged),
        TextFieldPassword(
          onChangedPassword:
              context.read<ValidationWithLoginCubit>().passwordChanged,
          secureText: true,
          onPressedIcon: context.read<ValidationWithLoginCubit>().viewPass,
        ),
        SizedBox(
          height: 30,
        ),
        ButtonLogin(onPressed: () => validationWithLogin(context)),
      ],
    );
  }

  void validationWithLogin(BuildContext context) {
    final validationWithLogin = context.read<ValidationWithLoginCubit>();
    validationWithLogin.loginValidationWithLogin();
  }
}
