import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_style_sizes.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:my_demo_app/view/widgets/auth_button.dart';
import 'package:my_demo_app/view/widgets/auth_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNAmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> radioOptions = ['Male', 'Female'];
  String? currentRadio;
  bool checkValue = false;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNAmeController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    currentRadio = radioOptions[0];
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
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
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
                    radioButtons,
                    PhoneFormField(
                      initialValue: PhoneNumber.parse(
                        '+94',
                      ), // or use the controller
                      // validator: PhoneValidator.compose([
                      //   PhoneValidator.required(Text('data')),
                      //   PhoneValidator.validMobile(),
                      // ]),
                      countrySelectorNavigator:
                          const CountrySelectorNavigator.page(),
                      onChanged:
                          (phoneNumber) => print('changed into $phoneNumber'),
                      enabled: true,
                      isCountrySelectionEnabled: true,
                      isCountryButtonPersistent: true,
                      countryButtonStyle: const CountryButtonStyle(
                        showDialCode: true,
                        // showIsoCode: true,
                        showFlag: true,
                        flagSize: 16,
                      ),

                      // + all parameters of TextField
                      // + all parameters of FormField
                      // ...
                    ),
                    AuthField(
                      hintText: 'Email',
                      controller: emailController,
                      validator: (email) => Validator.emailValidation(email),
                    ),
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
                    CheckboxListTile(
                      value: checkValue,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            checkValue = value;
                          });
                        }
                      },
                      title: Text('Agree with Terms & Conditions'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    AuthButton(
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.popAndPushNamed(
                            context,
                            RouteNames.loginScreen,
                          );
                        }
                      },
                      buttonText: AppTexts.signUpText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get radioButtons => Row(
    children: [
      Flexible(
        flex: 1,
        child: RadioListTile<String>(
          title: Text(radioOptions[0]),
          value: radioOptions[0],
          groupValue: currentRadio,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                currentRadio = value.toString();
              });
            }
          },
        ),
      ),
      Flexible(
        flex: 1,
        child: RadioListTile(
          title: Text(radioOptions[1]),
          value: radioOptions[1],
          groupValue: currentRadio,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                currentRadio = value.toString();
              });
            }
          },
        ),
      ),
    ],
  );
}
