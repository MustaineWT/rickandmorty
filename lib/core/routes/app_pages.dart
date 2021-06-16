import 'package:ecommers_app/presentation/views/home/view.dart';
import 'package:ecommers_app/presentation/views/login/view.dart';
import 'package:ecommers_app/presentation/views/splash/view.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

//!* Main routes of the application
abstract class AppPages {
  static const String INITIAL = AppRoutes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.SPLASH: (_) => SplashView(),
    AppRoutes.HOME: (_) => HomeView(),
    AppRoutes.LOGIN: (_) => LoginView(),
  };
}
