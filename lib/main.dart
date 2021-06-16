import 'package:flutter/material.dart';

import 'core/routes/app_pages.dart';

import 'injection_container.dart' as di;
import 'presentation/views/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
      initialRoute: AppPages.INITIAL,
      routes: AppPages.routes,
    );
  }
}
