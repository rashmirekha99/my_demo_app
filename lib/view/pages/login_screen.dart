import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_images.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/view/dialogs/exit_app_dialog.dart';
import 'package:my_demo_app/view/widgets/auth_button.dart';
import 'package:my_demo_app/view/widgets/auth_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            final bool res = Navigator.canPop(context);
            if (res) {
              Navigator.of(context).pop();
            }
            dialogBox(context);
          },
          icon: Icon(Icons.adaptive.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyleSizes.screenHorizontalPAdding,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                spacing: 25,
                children: [
                  Image.asset(
                    AppImages.logoImage,
                    width: AppStyleSizes.appLogoWidth,
                  ),
                  Text(
                    AppTexts.loginText,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.gradient2,
                    ),
                  ),
                  AuthField(
                    hintText: 'User Name',
                    controller: usernameController,
                  ),

                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureTExt: true,
                  ),

                  AuthButton(
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.popAndPushNamed(
                          context,
                          RouteNames.homeScreen,
                        );
                      }
                    },
                    buttonText: AppTexts.loginText,
                  ),
                  signUp,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //don't have account
  Widget get signUp => GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, RouteNames.signUpScreen);
    },
    child: RichText(
      text: TextSpan(
        style: TextStyle(color: ColorPalette.blackColor),
        text: AppTexts.dontHaveAccount,
        children: [
          TextSpan(
            style: TextStyle(
              color: ColorPalette.gradient2,
              fontWeight: FontWeight.bold,
            ),
            text: AppTexts.signUpText,
          ),
        ],
      ),
    ),
  );
}
