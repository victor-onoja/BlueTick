import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyWorkspacebody extends Equatable {
  final int? token;
  final String? email;

  const VerifyWorkspacebody({this.token, this.email});

  factory VerifyWorkspacebody.fromBody(Map<String, dynamic> data) {
    return VerifyWorkspacebody(
      token: data['token'] as int?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toBody() => {
        'token': token,
        'email': email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VerifyWorkspacebody].
  factory VerifyWorkspacebody.fromJson(String data) {
    return VerifyWorkspacebody.fromBody(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VerifyWorkspacebody] to a JSON string.
  String toJson() => json.encode(toBody());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, email];
}
