import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureTExt;
  final bool isPasswordVisible;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureTExt = false,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureTExt,
      decoration: AppStyles.textFormFieldStyle.copyWith(
        hintText: 'Enter your $hintText',
        labelText: hintText,
        // suffixIcon: Visibility(
        //   visible: isObscureTExt,
        //   child: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye)),
        // ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is Missing";
        }
        return null;
      },
    );
  }
}
