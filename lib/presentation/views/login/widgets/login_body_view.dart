import 'package:ecommers_app/presentation/cubit/validation_with_login/cubit.dart';
import 'package:ecommers_app/presentation/views/home/view.dart';
import 'package:ecommers_app/presentation/widgets/ShowDialogMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'body_login.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<ValidationWithLoginCubit>(),
      child: BlocBuilder<ValidationWithLoginCubit, ValidationWithLoginState>(
        builder: (context, state) {
          return _buildContentLoadLogin(context, state, size);
        },
      ),
    );
  }

  _buildContentLoadLogin(context, state, size) {
    if (state is ValidationWithLoginInitial) {
      return BodyLogin();
    } else if (state is ValidationWithLoginLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ValidationWithLoginLoaded) {
      final requestTokenModel = state.requestTokenModel;
      // ignore: unnecessary_null_comparison
      if (requestTokenModel.status != null) {
        return HomeView();
      }
    } else if (state is ValidationWithLoginError) {
      return ShowDialogMessage.showDialogMessage(
          context, 'Información', state.message);
    } else {
      return Container(
        child: Center(
          child: Text('Error'),
        ),
      );
    }
  }
}
