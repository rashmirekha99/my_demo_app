import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/show_snack_bar.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:my_demo_app/view/widgets/auth_button.dart';
import 'package:my_demo_app/view/widgets/auth_field.dart';
import 'package:my_demo_app/view/widgets/check_box.dart';
import 'package:my_demo_app/view/widgets/drop_down.dart';
import 'package:my_demo_app/view/widgets/phone_field.dart';
import 'package:my_demo_app/view/widgets/radio_button_section.dart';
import 'package:provider/provider.dart';

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

  final _formKey = GlobalKey<FormState>();

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
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyleSizes.screenHorizontalPAdding,
                vertical: AppStyleSizes.screenVerticallPAdding,
              ),
              child: _form,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _form => Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: _formKey,
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
          hintText: 'First Name',
          controller: firstNameController,
          validator: (fname) => Validator.emptyValidation(fname),
        ),

        AuthField(
          hintText: 'Last Name',
          controller: lastNAmeController,
          validator: (lname) => Validator.emptyValidation(lname),
        ),
        RadioButtonSection(),
        PhoneField(),
        AuthField(
          hintText: 'Email',
          controller: emailController,
          validator: (email) => Validator.emailValidation(email),
        ),

        CountryDropDown(),
        AuthField(
          hintText: 'Password',
          controller: passwordController,
          isObscureTExt: true,
          validator: (pswrd) => Validator.passwordValidator(pswrd),
        ),
        AuthField(
          hintText: 'Confirm Password',
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
            if (_formKey.currentState != null) {
              final checkBoxValue = context.read<FormProvider>().checBoxValue;

              if (_formKey.currentState!.validate()) {
                if (checkBoxValue) {
                  Navigator.popAndPushNamed(context, RouteNames.loginScreen);
                } else {
                  return showSnackBar(
                    context,
                    message:
                       AppTexts.termsConditionErrorMsg ,
                    color: ColorPalette.textFieldErrorBorderColor,
                  );
                }
              }
            }
          },
          buttonText: AppTexts.signUpText,
        ),
      ],
    ),
  );
}
