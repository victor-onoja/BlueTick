import 'package:flutter/cupertino.dart';

extension ValidationExtension on BuildContext {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateEmailAddress(String? value) {
    if (value == null) return 'Email cannot be empty';

    if (value.isEmpty) return 'Email cannot be empty';

    ///Check this line
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailIsValid ? 'Enter a valid Email Address' : null;
  }

  String? validatePassword(String? value) => value == null || value.length < 6
      ? 'Password must have 6 or more characters'
      : null;
}
