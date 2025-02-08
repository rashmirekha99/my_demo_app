import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String _gender = '';
  String get gender => _gender;
  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }
}
