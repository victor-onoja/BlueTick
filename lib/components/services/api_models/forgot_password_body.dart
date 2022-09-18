import 'dart:convert';

import 'package:equatable/equatable.dart';

class ForgotPasswordBody extends Equatable {
  final String? email;

  const ForgotPasswordBody({this.email});

  factory ForgotPasswordBody.fromBody(Map<String, dynamic> data) {
    return ForgotPasswordBody(
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toBody() => {
        'email': email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ForgotPasswordBody].
  factory ForgotPasswordBody.fromJson(String data) {
    return ForgotPasswordBody.fromBody(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ForgotPasswordBody] to a JSON string.
  String toJson() => json.encode(toBody());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email];
}
