import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_demo_app/constants/apis.dart';
import 'package:my_demo_app/models/country_model.dart';

class ApiServices {
  static Future<List<String>?> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(Apis.coutryApi));
      final List<dynamic> list = jsonDecode(response.body);
      // List<Country> countryList =
      //     list.map((country) => Country.fromJson(country)).toList();
      final List<String> counties =
          list.map((country) => country['name']['common'] as String).toList();

      return counties;
    } catch (e) {
      return null;
    }
  }
}
