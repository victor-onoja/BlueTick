import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {

	final String? message;
	final String? workspacename;
	final bool? isAdmin;
	final String? token;

	const LoginResponse({
		this.message, 
		this.workspacename, 
		this.isAdmin, 
		this.token, 
	});

	factory LoginResponse.fromLoginResponse(Map<String, dynamic> data) {
		return LoginResponse(
			message: data['message'] as String?,
			workspacename: data['workspacename'] as String?,
			isAdmin: data['is_admin'] as bool?,
			token: data['token'] as String?,
		);
	}



	Map<String, dynamic> toLoginResponse() => {
				'message': message,
				'workspacename': workspacename,
				'is_admin': isAdmin,
				'token': token,
			};


  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginResponse].
  factory LoginResponse.fromJson(String data) {
    return LoginResponse.fromLoginResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginResponse] to a JSON string.
  String toJson() => json.encode(toLoginResponse());


	@override
	List<Object?> get props => [message, workspacename, isAdmin, token];

}
