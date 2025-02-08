import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/providers/country_provider.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/app_theme.dart';
import 'package:my_demo_app/view/pages/home_screen.dart';
import 'package:my_demo_app/view/pages/login_screen.dart';
import 'package:my_demo_app/view/pages/sign_up_screen.dart';
import 'package:my_demo_app/view/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormProvider()),
        ChangeNotifierProvider(create: (context) => CountryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppTexts.appName,
        theme: AppTheme.appLightTheme,
        home: const SplashScreen(),
        routes: {
          RouteNames.loginScreen: (context) => LoginScreen(),
          RouteNames.signUpScreen: (context) => SignUpScreen(),
          RouteNames.homeScreen: (context) => HomeScreen(),
        },
      ),
    );
  }
}
