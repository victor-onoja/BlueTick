import 'dart:convert';

import 'package:equatable/equatable.dart';

class StaffSignUpBody extends Equatable {
	final String? email;
	final String? invitationLink;

	const StaffSignUpBody({this.email, this.invitationLink});

	factory StaffSignUpBody.fromMap(Map<String, dynamic> data) {
		return StaffSignUpBody(
			email: data['email'] as String?,
			invitationLink: data['invitation_link'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'email': email,
				'invitation_link': invitationLink,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StaffSignUpBody].
	factory StaffSignUpBody.fromJson(String data) {
		return StaffSignUpBody.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [StaffSignUpBody] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [email, invitationLink];
}
