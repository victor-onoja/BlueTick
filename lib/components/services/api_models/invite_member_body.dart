import 'dart:convert';

import 'package:equatable/equatable.dart';

class InviteMemberBody extends Equatable {
  final List<dynamic>? emailList;
  final String? workspacename;

  const InviteMemberBody({this.emailList, this.workspacename});

  factory InviteMemberBody.fromMap(Map<String, dynamic> data) {
    return InviteMemberBody(
      emailList: data['email_list'] as List<dynamic>?,
      workspacename: data['workspacename'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'email_list': emailList,
        'workspacename': workspacename,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InviteMemberBody].
  factory InviteMemberBody.fromJson(String data) {
    return InviteMemberBody.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InviteMemberBody] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [emailList, workspacename];
}
