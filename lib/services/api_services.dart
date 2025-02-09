import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_demo_app/constants/apis.dart';

class ApiServices {
  static Future<List<String>?> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(Apis.countryApi));
      final List<dynamic> list = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<String> countries =
            list.map((country) => country['name']['common'] as String).toList();

        return countries;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
