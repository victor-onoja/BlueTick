import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdminSignupbody extends Equatable {
  final String? email;
  final String? password1;
  final String? password2;
  final String? phone;
  final String? workspaceName;

  const AdminSignupbody({
    this.email,
    this.password1,
    this.password2,
    this.phone,
    this.workspaceName,
  });

  factory AdminSignupbody.fromBody(Map<String, dynamic> data) {
    return AdminSignupbody(
      email: data['email'] as String?,
      password1: data['password1'] as String?,
      password2: data['password2'] as String?,
      phone: data['phone'] as String?,
      workspaceName: data['workspace_name'] as String?,
    );
  }

  Map<String, dynamic> toBody() => {
        'email': email,
        'password1': password1,
        'password2': password2,
        'phone': phone,
        'workspace_name': workspaceName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdminSignupbody].
  factory AdminSignupbody.fromJson(String data) {
    return AdminSignupbody.fromBody(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdminSignupbody] to a JSON string.
  String toJson() => json.encode(toBody());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      email,
      password1,
      password2,
      phone,
      workspaceName,
    ];
  }
}
