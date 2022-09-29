import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpResponse extends Equatable {
	final String? message;
	final String? token;

	const SignUpResponse({this.message, this.token});

	factory SignUpResponse.fromSignUpResponse(Map<String, dynamic> data) {
		return SignUpResponse(
			message: data['message'] as String?,
			token: data['token'] as String?,
		);
	}



	Map<String, dynamic> toSignUpResponse() => {
				'message': message,
				'token': token,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignUpResponse].
	factory SignUpResponse.fromJson(String data) {
		return SignUpResponse.fromSignUpResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SignUpResponse] to a JSON string.
	String toJson() => json.encode(toSignUpResponse());

	@override
	List<Object?> get props => [message, token];
}
