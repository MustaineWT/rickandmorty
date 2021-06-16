import 'package:ecommers_app/core/framework/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_body_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundsplash,
      body: SplashBodyView(),
    );
  }
}
