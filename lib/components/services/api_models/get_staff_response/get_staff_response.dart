import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'all_staff_detail.dart';

class GetStaffResponse extends Equatable {
  final int? staffNumber;
  final List<AllStaffDetail>? allStaffDetails;

  const GetStaffResponse({this.staffNumber, this.allStaffDetails});

  factory GetStaffResponse.fromResponse(Map<String, dynamic> data) {
    return GetStaffResponse(
      staffNumber: data['staff number'] as int?,
      allStaffDetails: (data['all staff details'] as List<dynamic>?)
          ?.map((e) => AllStaffDetail.fromResponse(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toResponse() => {
        'staff number': staffNumber,
        'all staff details':
            allStaffDetails?.map((e) => e.toResponse()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetStaffResponse].
  factory GetStaffResponse.fromJson(String data) {
    return GetStaffResponse.fromResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetStaffResponse] to a JSON string.
  String toJson() => json.encode(toResponse());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [staffNumber, allStaffDetails];
}
