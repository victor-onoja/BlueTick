import 'dart:convert';

import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String? email;
  final String? password;

  const Login({this.email, this.password});

  factory Login.fromLogin(Map<String, dynamic> data) => Login(
        email: data['email'] as String?,
        password: data['password'] as String?,
      );

  Map<String, dynamic> toLogin() => {
        'email': email,
        'password': password,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Login].
  factory Login.fromJson(String data) {
    return Login.fromLogin(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Login] to a JSON string.
  String toJson() => json.encode(toLogin());

  Login copyWith({
    String? email,
    String? password,
  }) {
    return Login(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password];
}
