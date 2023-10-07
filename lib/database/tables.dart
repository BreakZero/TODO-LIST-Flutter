// ignore_for_file: constant_identifier_names

import 'dart:ffi';

class UserEntity {
  static const table_name = "tb_local_user";
  static const col_uid = "_uid";
  static const col_fullname = "full_name";
  static const col_email = "email";
  static const col_create_at = "create_at";

  final int uid;
  final String fullName;
  final String email;
  final int createAt;

  UserEntity({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.createAt
  });

  UserEntity.fromMap(Map<String, dynamic> map): this(
    uid: int.parse(map[col_uid]),
    fullName: map[col_fullname],
    email: map[col_email],
    createAt: map[col_create_at]
  );

  Map<String, dynamic> toMap() {
    return {
      col_uid: uid,
      col_fullname: fullName,
      col_email: email,
      col_create_at: createAt
    };
  }

  @override
  String toString() {
    return "{_uid: $uid, full_name: $fullName, email: $email, create_at: $createAt}";
  }
}

class TaskEntity {
  final Long id;
  final String title;
  final String description;
  final Long deadline;
  final Long createAt;
  final String? attachmentPath;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createAt,
    required this.deadline,
    this.attachmentPath
  });
}
