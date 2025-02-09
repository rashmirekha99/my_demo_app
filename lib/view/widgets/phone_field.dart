import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, this.validator});
  // final PhoneController phoneController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (field) {
        return PhoneFormField(
          // controller: phoneController,
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
        );
      },
    );
  }
}
