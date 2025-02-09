import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Validator {
  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is Missing';
    } else if (password.length < 6) {
      return 'Password should be more than 6 characters ';
    }
    return null;
  }

  static String? emptyValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Missing Value';
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is Missing';
    }
    final bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPasswrd) {
    if (confirmPasswrd == null || confirmPasswrd.isEmpty) {
      return 'Missing Confirm Password';
    } else if (password != confirmPasswrd) {
      return 'Confirm Password doesn\'t match';
    }
    return null;
  }

  static PhoneNumberInputValidator? mobilePhoneValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(
      PhoneValidator.valid(context, errorText: 'Invalid Mobile No'),
    );
    validators.add(
      PhoneValidator.required(context, errorText: 'Missing Mobile No'),
    );
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }
}
