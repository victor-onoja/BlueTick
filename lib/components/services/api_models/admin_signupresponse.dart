import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdminSignupresponse extends Equatable {
  final String? message;
  final String? token;

  const AdminSignupresponse({this.message, this.token});

  factory AdminSignupresponse.fromResponse(Map<String, dynamic> data) {
    return AdminSignupresponse(
      message: data['message'] as String?,
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toResponse() => {
        'message': message,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdminSignupresponse].
  factory AdminSignupresponse.fromJson(String data) {
    return AdminSignupresponse.fromResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdminSignupresponse] to a JSON string.
  String toJson() => json.encode(toResponse());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, token];
}
