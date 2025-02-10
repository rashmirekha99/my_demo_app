import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/controllers/sign_up_controller.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:my_demo_app/view/widgets/app_bar.dart';
import 'package:my_demo_app/view/widgets/auth_button.dart';
import 'package:my_demo_app/view/widgets/auth_field.dart';
import 'package:my_demo_app/view/widgets/auth_field_password.dart';
import 'package:my_demo_app/view/widgets/check_box.dart';
import 'package:my_demo_app/view/widgets/drop_down.dart';
import 'package:my_demo_app/view/widgets/phone_field.dart';
import 'package:my_demo_app/view/widgets/radio_button_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNAmeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNAmeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyleSizes.screenHorizontalPAdding,
              ).copyWith(bottom: AppStyleSizes.screenVerticallPAdding),
              child: _form,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _form => Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      spacing: AppStyleSizes.screenVerticallPAdding,
      children: [
        Text(
          AppTexts.signUpText,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: ColorPalette.gradient2,
          ),
        ),
        AuthField(
          hintText: AppTexts.firstName,
          controller: firstNameController,
          validator:
              (fname) => Validator.emptyValidation(
                fname,
                fieldName: AppTexts.firstName,
              ),
        ),

        AuthField(
          hintText: AppTexts.lastName,
          controller: lastNAmeController,
          validator:
              (lname) => Validator.emptyValidation(
                lname,
                fieldName: AppTexts.lastName,
              ),
        ),
        RadioButtonSection(),
        PhoneField(),
        AuthField(
          hintText: AppTexts.email,
          controller: emailController,
          validator: (email) => Validator.emailValidation(email),
        ),

        CountryDropDown(),
        AuthFieldPassword(
          hintText: AppTexts.password,
          controller: passwordController,
        ),
        AuthField(
          hintText: AppTexts.confirmPassword,
          controller: confirmPasswordController,
          isObscureTExt: true,
          validator:
              (confirmPwrd) => Validator.confirmPassword(
                passwordController.text,
                confirmPwrd,
              ),
        ),
        AppCheckBox(),
        AuthButton(
          onpress: () {
            SignUpController.handleSignUp(context, formKey);
          },
          buttonText: AppTexts.signUpText,
        ),
      ],
    ),
  );
}
