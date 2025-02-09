import 'package:flutter/material.dart';
import 'package:my_demo_app/theme/color_palette.dart';

class AppStyles {
  //textform field styles
  static const InputDecoration textFormFieldStyle = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorPalette.textFieldBorderColor,
        width: 3,
      ),
    ),
    fillColor: ColorPalette.textFieldBorderColor,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.gradient2, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorPalette.textFieldErrorBorderColor,
        width: 3,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorPalette.textFieldErrorBorderColor,
        width: 3,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.textFieldColor, width: 3),
    ),
  );
}
