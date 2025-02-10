import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/providers/password_provider.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:provider/provider.dart';

class AuthFieldPassword extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureTExt;
  final bool isPasswordVisible;
  const AuthFieldPassword({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureTExt = false,
    this.isPasswordVisible = false,
  });

  @override
  State<AuthFieldPassword> createState() => _AuthFieldPasswordState();
}

class _AuthFieldPasswordState extends State<AuthFieldPassword> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Selector<PasswordProvider, String>(
      selector: (context, provider) => provider.passwordHelperText,
      builder: (context, helperText, child) {
        return Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              obscureText: !isVisible,
              decoration: AppStyles.textFormFieldStyle.copyWith(
                hintText: 'Enter your ${widget.hintText}',
                labelText: widget.hintText,
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
              onChanged:
                  (value) => context
                      .read<PasswordProvider>()
                      .passwordHelperTextGenerator(value),
              validator: (password) => Validator.passwordValidator(password),
            ),
            if (helperText.isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(textAlign: TextAlign.left, helperText),
                ),
              ),
          ],
        );
      },
    );
  }
}
