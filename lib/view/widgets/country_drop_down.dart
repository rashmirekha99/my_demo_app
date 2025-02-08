import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_styles.dart';
import 'package:my_demo_app/providers/form_provider.dart';
import 'package:my_demo_app/services/api_services.dart';
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
          return CircularProgressIndicator.adaptive();
        } else if (snapshot.hasError) {
          return SnackBar(content: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return DropdownMenu(
            inputDecorationTheme: AppStyles.dropDownFieldStyle,
            label: Text('Select a Country'),
            width: screenWidth,
            enableFilter: true,
            onSelected: (value) {
              if (value != null) {
                context.read<FormProvider>().setCountry(value);
              }
            },
            dropdownMenuEntries:
                snapshot.data!
                    .map(
                      (country) =>
                          DropdownMenuEntry(value: country, label: country),
                    )
                    .toList(),
          );
        } else {
          return DropdownMenu(
            label: Text('Select a Country'),
            width: screenWidth,
            enableFilter: true,
            dropdownMenuEntries: [
              DropdownMenuEntry(
                enabled: false,
                value: 'No data',
                label: 'No data',
              ),
            ],
          );
        }
      },
    );
  }
}
