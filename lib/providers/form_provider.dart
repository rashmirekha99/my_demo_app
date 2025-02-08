import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/gender_enum.dart';

class FormProvider extends ChangeNotifier {
  Gender _gender = Gender.male;
  String _country = '';
  bool _checkBoxValue = false;
  Gender get gender => _gender;
  String get country => _country;
  bool get checBoxValue => _checkBoxValue;
  void setGender(Gender gender) {
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

  void setCheckBoxValue(bool value) {
    if (value != _checkBoxValue) {
      _checkBoxValue = value;
    }
    notifyListeners();
  }
}
