import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyWorkspaceresponse extends Equatable {
  final String? message;

  const VerifyWorkspaceresponse({this.message});

  factory VerifyWorkspaceresponse.fromResponse(Map<String, dynamic> data) {
    return VerifyWorkspaceresponse(
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toResponse() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VerifyWorkspaceresponse].
  factory VerifyWorkspaceresponse.fromJson(String data) {
    return VerifyWorkspaceresponse.fromResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VerifyWorkspaceresponse] to a JSON string.
  String toJson() => json.encode(toResponse());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
