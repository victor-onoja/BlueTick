import 'dart:convert';

import 'package:equatable/equatable.dart';

class InviteMemberResponse extends Equatable {
  final String? message;
  final List<dynamic>? link;

  const InviteMemberResponse({this.message, this.link});

  factory InviteMemberResponse.fromMap(Map<String, dynamic> data) {
    return InviteMemberResponse(
      message: data['message'] as String?,
      link: data['link'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'link': link,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InviteMemberResponse].
  factory InviteMemberResponse.fromJson(String data) {
    return InviteMemberResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InviteMemberResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  InviteMemberResponse copyWith({
    String? message,
    List<String>? link,
  }) {
    return InviteMemberResponse(
      message: message ?? this.message,
      link: link ?? this.link,
    );
  }

  @override
  List<Object?> get props => [message, link];
}
