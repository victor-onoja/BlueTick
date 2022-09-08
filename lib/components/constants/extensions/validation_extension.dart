import 'package:flutter/cupertino.dart';

extension ValidationExtension on BuildContext {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateEmailAddress(String? value) {
    if (value == null) return 'Email cannot be empty';

    if (value.isEmpty) return 'Email cannot be empty';

    ///Check this line Regular Expression
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailIsValid ? 'Email must contain "@" and "."' : null;
  }


  String? validatePassword(String? value) =>
      value == null || value.length < 6 || value.isEmpty
          ? 'Password must have 6 or more characters'
          : null;

  String? validatePhoneNumber(String? value) =>
      value == null || value.isEmpty || value.length != 11
          ? 'Enter a valid phone number'
          : null;

  String? validateFullName<T>(String? value, BuildContext context) {
    if (value == null) return 'full name cannot be null';

    if (value.isEmpty) return 'full name cannot be empty';

    if (value.split(' ').length < 2) {
      return 'please enter your full name';
    }
    return null;
  }

  String? validatePassword(String? value) => value == null || value.length < 6
      ? 'Password must have 6 or more characters'
      : null;

}
