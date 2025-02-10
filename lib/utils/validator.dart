import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Validator {
  static String? passwordValidator(String? password) {
    RegExp reg = RegExp(
      r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-!@#$%^&*+])[A-Za-z\d\-!@#$%^&*+]{8,30}$)',
    );
    if (password == null || password.isEmpty) {
      return 'Password is Missing';
    } else if (!reg.hasMatch(password)) {
      return 'Invalid Password';
    }
    return null;
  }

  static String? emptyValidation(String? value, {required String fieldName}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is Missing';
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is Missing';
    }
    final bool isValid = EmailValidator.validate(email.trim());
    if (!isValid) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPasswrd) {
    if (confirmPasswrd == null || confirmPasswrd.isEmpty) {
      return 'Confirm Password is Missing';
    } else if (password != confirmPasswrd) {
      return 'Confirm password doesn\'t match';
    }
    return null;
  }

  static PhoneNumberInputValidator? mobilePhoneValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(
      PhoneValidator.valid(context, errorText: 'Invalid Mobile No'),
    );
    validators.add(
      PhoneValidator.required(context, errorText: 'Mobile No is Missing'),
    );
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }
}
