import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/app_theme.dart';
import 'package:my_demo_app/view/pages/login_screen.dart';
import 'package:my_demo_app/view/pages/sign_up_screen.dart';
import 'package:my_demo_app/view/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.appName,
      theme: AppTheme.appLightTheme,
      home: const SplashScreen(),
      routes: {
        RouteNames.loginScreen: (context) => LoginScreen(),
        RouteNames.signUpScreen: (context) => SignUpScreen(),
      },
    );
  }
}
