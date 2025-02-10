import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/constants/app_texts.dart';
import 'package:my_demo_app/providers/country_provider.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/theme/color_palette.dart';
import 'package:my_demo_app/utils/validator.dart';
import 'package:provider/provider.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({super.key});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final countryProvider = context.read<CountryProvider>();
      if (countryProvider.countries == null) {
        countryProvider.fetchCountries();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Consumer<CountryProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
          return _defaultDropDown(
            screenWidth: screenWidth,
            items: _defaultMenuItem(AppTexts.loadingText),
            onChanged: (v) {},
          );
        } else if (data.countries != null) {
          return _defaultDropDown(
            screenWidth: screenWidth,
            items:
                data.countries!
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
          );
        } else {
          return _defaultDropDown(
            screenWidth: screenWidth,
            items: _defaultMenuItem(AppTexts.noData),
            onChanged: (v) {},
          );
        }
      },
    );
  }

  Widget _defaultDropDown({
    required double screenWidth,
    required List<DropdownMenuItem<String>> items,
    required void Function(String?)? onChanged,
  }) {
    return SizedBox(
      width: screenWidth,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        dropdownColor: ColorPalette.backgroundColor,
        decoration: AppStyles.textFormFieldStyle,
        hint: Text(AppTexts.selectCountry),
        validator: (value) => Validator.emptyValidation(value,fieldName: 'Country'),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
//nodata or loading
  List<DropdownMenuItem<String>> _defaultMenuItem(String status) {
    return [
      DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: null,
        enabled: false,
        child: Text(status, style: TextStyle(color: ColorPalette.shadowColor)),
      ),
    ];
  }
}
