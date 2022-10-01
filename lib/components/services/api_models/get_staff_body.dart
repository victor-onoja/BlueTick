import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetStaffBody extends Equatable {
  final String? workspacename;

  const GetStaffBody({this.workspacename});

  factory GetStaffBody.fromBody(Map<String, dynamic> data) => GetStaffBody(
        workspacename: data['workspacename'] as String?,
      );

  Map<String, dynamic> toBody() => {
        'workspacename': workspacename,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetStaffBody].
  factory GetStaffBody.fromJson(String data) {
    return GetStaffBody.fromBody(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetStaffBody] to a JSON string.
  String toJson() => json.encode(toBody());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [workspacename];
}
