import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/routes/route_names.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/show_snack_bar.dart';
import 'package:provider/provider.dart';

class SignUpController {
  static void handleSignUp(BuildContext context, GlobalKey<FormState> formKey) {
    if (formKey.currentState != null) {
      final checkBoxValue = context.read<FormProvider>().checBoxValue;

      if (formKey.currentState!.validate()) {
        if (checkBoxValue) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.loginScreen,
            ModalRoute.withName(RouteNames.loginScreen),
          );
        } else {
          return showSnackBar(
            context,
            message: AppTexts.termsConditionErrorMsg,
            color: ColorPalette.textFieldErrorBorderColor,
          );
        }
      }
    }
  }
}
