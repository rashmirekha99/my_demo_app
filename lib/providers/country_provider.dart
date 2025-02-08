import 'package:flutter/material.dart';
import 'package:my_demo_app/models/country_model.dart';
import 'package:my_demo_app/services/api_services.dart';

class CountryProvider extends ChangeNotifier {
  List<DropdownMenuEntry> dropDownCountryList = [];
  
  // Future<void> getCountries() async {
  //   final List<Country>? countries = await ApiServices.fetchCountries();
  //   if (countries != null) {
  //     countries
  //         .map(
  //           (country) => dropDownCountryList.add(
  //             DropdownMenuEntry(value: country.name, label: country.name),
  //           ),
  //         )
  //         .toList();
  //   }
  //   notifyListeners();
  // }
}
