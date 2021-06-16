import 'package:ecommers_app/injection_container.dart';
import 'package:ecommers_app/presentation/cubit/validation_session/cubit.dart';
import 'package:ecommers_app/presentation/views/home/view.dart';
import 'package:ecommers_app/presentation/views/login/view.dart';
import 'package:ecommers_app/presentation/widgets/ShowDialogMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator_splash.dart';

class SplashBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<ValidationWithSessionCubit>(),
      child: BlocBuilder<ValidationWithSessionCubit, ValidationSessionState>(
        builder: (context, state) {
          return _buildContentLoadSplash(context, state, size);
        },
      ),
    );
  }

  Widget _buildContentLoadSplash(
      BuildContext context, ValidationSessionState state, Size size) {
    if (state is ValidationSessionInitial) {
      _validationSession(context);
      return LoadingIndicatorSplash();
    } else if (state is ValidationSessionLoading) {
      return LoadingIndicatorSplash();
    } else if (state is ValidationSessionLoaded) {
      final session = state;
      print(session.session);
      if (session.session == 1) {
        return HomeView();
      } else {
        return LoginView();
      }
    } else if (state is ValidationSessionError) {
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

  void _validationSession(BuildContext context) {
    final validationSession = context.read<ValidationWithSessionCubit>();
    validationSession.getCubitValidationWithSession();
  }
}
