// ignore_for_file: constant_identifier_names

class UserEntity {
  static const table_name = "tb_local_user";
  static const col_uid = "_uid";
  static const col_fullname = "full_name";
  static const col_email = "email";
  static const col_create_at = "create_at";

  final int? uid;
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
    uid: map[col_uid],
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
  static const table_name = "tb_task";
  static const col_id = "_id";
  static const col_title = "title";
  static const col_description = "description";
  static const col_deadline = "deadline";
  static const col_create_at = "create_at";
  static const col_attachment_path = "attachment_path";

  final int? id;
  final String title;
  final String description;
  final int deadline;
  final int createAt;
  final String? attachmentPath;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createAt,
    required this.deadline,
    this.attachmentPath
  });

  TaskEntity.fromMap(Map<String, dynamic> map): this(
    id: map[col_id],
    title: map[col_title],
    description: map[col_description],
    createAt: map[col_create_at],
    deadline: map[col_deadline],
    attachmentPath: map[col_attachment_path]
  );

  Map<String, dynamic> toMap() {
    return {
      col_id: id,
      col_title: title,
      col_description: description,
      col_create_at: createAt,
      col_deadline: deadline,
      col_attachment_path: attachmentPath
    };
  }

  @override
  String toString() {
    return "{title: $title, description: $description, deadline: $deadline, attachment_path: $attachmentPath}";
  }
}
