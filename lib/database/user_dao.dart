import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/tables.dart';

class UserDao {
  final Database _db;
  
  const UserDao(this._db);

  Future insertUser(UserEntity user) async {
    _db.transaction((txn) async => {
      await txn.insert(UserEntity.table_name, user.toMap())
    });
  }

  Future<UserEntity?> currentUser() async {
    var result = await _db.rawQuery("SELECT * FROM tb_local_user;");
    if(result.isEmpty)return null;
    return UserEntity.fromMap(result.first);
  }
}