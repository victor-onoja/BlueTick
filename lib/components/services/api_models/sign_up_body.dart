import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpBody extends Equatable {
	final String? email;
	final String? password1;
	final String? password2;
	final String? role;
	final String? fullName;

	const SignUpBody({
		this.email, 
		this.password1, 
		this.password2, 
		this.role, 
		this.fullName, 
	});

	factory SignUpBody.fromSignUpBody(Map<String, dynamic> data) => SignUpBody(
				email: data['email'] as String?,
				password1: data['password1'] as String?,
				password2: data['password2'] as String?,
				role: data['role'] as String?,
				fullName: data['full_name'] as String?,
			);

	Map<String, dynamic> toSignUpBody() => {
				'email': email,
				'password1': password1,
				'password2': password2,
				'role': role,
				'full_name': fullName,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignUpBody].
	factory SignUpBody.fromJson(String data) {
		return SignUpBody.fromSignUpBody(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SignUpBody] to a JSON string.
	String toJson() => json.encode(toSignUpBody());

	@override
	List<Object?> get props {
		return [
				email,
				password1,
				password2,
				role,
				fullName,
		];
	}
}
