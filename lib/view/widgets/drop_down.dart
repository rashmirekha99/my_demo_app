import 'package:flutter/material.dart';
import 'package:my_demo_app/services/api_services.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key});

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
            label: Text('Select a Country'),
            width: screenWidth,
            enableFilter: true,
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
