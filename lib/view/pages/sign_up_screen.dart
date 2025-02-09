import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:my_demo_app/view/widgets/auth_button.dart';
import 'package:my_demo_app/view/widgets/auth_field.dart';
import 'package:my_demo_app/view/widgets/check_box.dart';
import 'package:my_demo_app/view/widgets/drop_down.dart.dart';
import 'package:my_demo_app/view/widgets/radio_button_section.dart';
import 'package:phone_form_field/phone_form_field.dart';

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
  final PhoneController _phoneController = PhoneController();
  final _formKey = GlobalKey<FormState>();
  bool isCountrySelected = false;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNAmeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _phoneController.dispose();
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
      spacing: 25,
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

        // PhoneField(
        //   validator: (value) {
        //     print(value);
        //     Validator.emptyValidation(value);
        //   },
        //   // phoneController: _phoneController,
        // ),
        PhoneFormField(
          // controller: _phoneController,
          decoration: AppStyles.textFormFieldStyle,
          initialValue: PhoneNumber.parse('+94'), // or use the controller
          validator: Validator.getValidator(context),
          countrySelectorNavigator: const CountrySelectorNavigator.page(),
          onChanged: (phoneNumber) => print('changed into $phoneNumber'),
          enabled: true,
          isCountrySelectionEnabled: true,
          isCountryButtonPersistent: true,
          countryButtonStyle: const CountryButtonStyle(
            showDialCode: true,
            // showIsoCode: true,
            showFlag: true,
            flagSize: 16,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
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
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.popAndPushNamed(context, RouteNames.loginScreen);
              }
            }
          },
          buttonText: AppTexts.signUpText,
        ),
      ],
    ),
  );
}
