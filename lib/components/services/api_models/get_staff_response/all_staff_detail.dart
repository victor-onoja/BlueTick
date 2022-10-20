import 'dart:convert';

import 'package:equatable/equatable.dart';

class AllStaffDetail extends Equatable {
  final int? id;
  final String? email;
  final String? role;
  final bool? isStaff;
  final bool? isAdmin;
  final String? workspace;
  final String? fullname;
  final String? profileimg;

  const AllStaffDetail({
    this.id,
    this.email,
    this.role,
    this.isStaff,
    this.isAdmin,
    this.workspace,
    this.fullname,
    this.profileimg,
  });

  factory AllStaffDetail.fromResponse(Map<String, dynamic> data) {
    return AllStaffDetail(
      id: data['id'] as int?,
      email: data['email'] as String?,
      role: data['role'] as String?,
      isStaff: data['is_staff'] as bool?,
      isAdmin: data['is_admin'] as bool?,
      workspace: data['workspace'] as String?,
      fullname: data['fullname'] as String?,
      profileimg: data['profileimg'] as String?,
    );
  }

  Map<String, dynamic> toResponse() => {
        'id': id,
        'email': email,
        'role': role,
        'is_staff': isStaff,
        'is_admin': isAdmin,
        'workspace': workspace,
        'fullname': fullname,
        'profileimg': profileimg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllStaffDetail].
  factory AllStaffDetail.fromJson(String data) {
    return AllStaffDetail.fromResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllStaffDetail] to a JSON string.
  String toJson() => json.encode(toResponse());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      role,
      isStaff,
      isAdmin,
      workspace,
      fullname,
      profileimg,
    ];
  }
}
