import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
    
      decoration: AppStyles.textFormFieldStyle,
      initialValue: PhoneNumber.parse('+94'),
      validator: Validator.mobilePhoneValidator(context),
      countrySelectorNavigator: const CountrySelectorNavigator.page(),
      countryButtonStyle: const CountryButtonStyle(
        showIsoCode: false,
        flagSize: 16,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
