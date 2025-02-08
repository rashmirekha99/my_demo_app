import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String _gender = '';
  String _country = '';
  String get gender => _gender;
  String get country => _country;
  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setCountry(String country) {
    _country = country;
    notifyListeners();
  }
}
