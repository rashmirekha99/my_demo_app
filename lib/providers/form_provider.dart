import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String _gender = '';
  String _country = '';
  String get gender => _gender;
  String get country => _country;
  void setGender(String gender) {
    if (gender != _gender) {
      _gender = gender;
      notifyListeners();
    }
  }

  void setCountry(String country) {
    if (country != _country) {
      _country = country;
    }
  }
}
