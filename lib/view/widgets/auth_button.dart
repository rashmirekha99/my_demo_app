import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/theme/color_palette.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onpress,
    required this.buttonText,
  });
  final VoidCallback onpress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyleSizes.buttonBorderRadius),
        gradient: LinearGradient(
          colors: [ColorPalette.gradient2, ColorPalette.gradient3],
        ),
      ),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorPalette.transparentColor,
          backgroundColor: ColorPalette.transparentColor,
          shadowColor: ColorPalette.transparentColor,
          minimumSize: Size(screenWidth, 50),
        ),
        child: Text(
          style: TextStyle(
            color: ColorPalette.textFieldBorderColor,
            fontSize: 20,
          ),
          buttonText,
        ),
      ),
    );
  }
}
