import 'dart:convert';

import 'package:equatable/equatable.dart';

class StaffSignUpResponse extends Equatable {
	final String? message;
	final String? workspaceName;

	const StaffSignUpResponse({this.message, this.workspaceName});

	factory StaffSignUpResponse.fromMap(Map<String, dynamic> data) {
		return StaffSignUpResponse(
			message: data['message'] as String?,
			workspaceName: data['workspace name'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'message': message,
				'workspace name': workspaceName,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StaffSignUpResponse].
	factory StaffSignUpResponse.fromJson(String data) {
		return StaffSignUpResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [StaffSignUpResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [message, workspaceName];
}
