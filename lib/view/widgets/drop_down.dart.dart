import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/services/api_services.dart';
import 'package:my_demo_app/utils/snack_bar.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:provider/provider.dart';

class CountryDropDown extends StatelessWidget {
  const CountryDropDown({super.key});

  Future<List<String>?> fetchCountries() async {
    final response = await ApiServices.fetchCountries();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return FutureBuilder(
      future: fetchCountries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _defaultDropDown(screenWidth, 'Loading...');
        } else if (snapshot.hasError) {
          showSnackBar(context, snapshot.error.toString());
          return _defaultDropDown(screenWidth, 'No data');
        } else if (snapshot.hasData) {
          return SizedBox(
            width: screenWidth,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: AppStyles.textFormFieldStyle,
              hint: Text('Select Country'),
              validator: (value) => Validator.emptyValidation(value),
              items:
                  snapshot.data!
                      .map(
                        (country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<FormProvider>().setCountry(value);
                }
              },
            ),
          );
        } else {
          return _defaultDropDown(screenWidth, 'No Data');
        }
      },
    );
  }

  Widget _defaultDropDown(screenWidth, status) {
    return SizedBox(
      width: screenWidth,
      child: DropdownButtonFormField<String>(
        isExpanded: true,

        decoration: AppStyles.textFormFieldStyle,
        hint: Text('Select Country'),
        validator: (value) => Validator.emptyValidation(value),
        onChanged: (value) {},
        items: [
          DropdownMenuItem(value: null, enabled: false, child: Text(status)),
        ],
      ),
    );
  }
}
