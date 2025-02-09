import 'package:flutter/cupertino.dart';
import 'package:my_demo_app/services/api_services.dart';

class CountryProvider extends ChangeNotifier {
  List<String>? _countries;
  bool _isLoading = false;

  List<String>? get countries => _countries;
  bool get isLoading => _isLoading;
  Future<void> fetchCountries() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiServices.fetchCountries();
      _countries = response;
    } catch (error) {
      _countries = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
