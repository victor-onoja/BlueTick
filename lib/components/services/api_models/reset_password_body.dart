import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResetPasswordBody extends Equatable {
  final String? email;
  final String? password;
  final String? password2;

  const ResetPasswordBody({this.email, this.password, this.password2});

  factory ResetPasswordBody.fromBody(Map<String, dynamic> data) {
    return ResetPasswordBody(
      email: data['email'] as String?,
      password: data['password'] as String?,
      password2: data['password2'] as String?,
    );
  }

  Map<String, dynamic> toBody() => {
        'email': email,
        'password': password,
        'password2': password2,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResetPasswordBody].
  factory ResetPasswordBody.fromJson(String data) {
    return ResetPasswordBody.fromBody(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResetPasswordBody] to a JSON string.
  String toJson() => json.encode(toBody());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, password2];
}
