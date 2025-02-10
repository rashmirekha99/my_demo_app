import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureTExt;
  final bool isPasswordVisible;
  final String? Function(String?)? validator;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureTExt = false,
    this.isPasswordVisible = false,
    required this.validator,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscureTExt ? !isVisible : false,
      decoration: AppStyles.textFormFieldStyle.copyWith(
        hintText: 'Enter ${widget.hintText}',
        labelText: widget.hintText,
        suffixIcon:
            widget.isObscureTExt
                ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                )
                : null,
      ),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
