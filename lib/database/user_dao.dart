import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/tables.dart';

class UserDao {
  final Database _db;

  const UserDao(this._db);

  Future<void> insertUser(UserEntity user) async {
    await _db.insert(UserEntity.table_name, user.toMap());
  }

  Future<UserEntity?> currentUser() async {
    final result = await _db.query(UserEntity.table_name, limit: 1);
    if (result.isEmpty) return null;
    return UserEntity.fromMap(result.first);
  }
}