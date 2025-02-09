import 'package:flutter/material.dart';
import 'package:my_demo_app/constants/app_texts.dart';

class PasswordProvider extends ChangeNotifier{
  String _helperText = AppTexts.passwordHelperText;
  String get passwordHelperText => _helperText;
  void passwordHelperTextGenerator(String password) {
    _helperText = "";
    if (password.length < 8 || password.length > 30) {
      _helperText += "❌ 8-30 characters\n";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      _helperText += "❌ At least one lowercase letter\n";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      _helperText += "❌ At least one uppercase letter\n";
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      _helperText += "❌ At least one number\n";
    }
    if (!RegExp(r'[-!@#$%^&*+]').hasMatch(password)) {
      _helperText += "❌ At least one character\n";
    }
    notifyListeners();
  }
}