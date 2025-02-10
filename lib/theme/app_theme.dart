import 'package:flutter/material.dart';
import 'package:my_demo_app/theme/color_palette.dart';

class AppTheme {
  static final appLightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: ColorPalette.backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.gradient2),
    appBarTheme: AppBarTheme(backgroundColor: ColorPalette.backgroundColor),
   
  );
}
