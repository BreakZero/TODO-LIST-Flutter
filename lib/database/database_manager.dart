import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/tables.dart';

class DatabaseManager {
  static final DatabaseManager _databaseManager = DatabaseManager._internal();

  DatabaseManager._internal();

  static const _databaseName = "todo_list.db";
  static const _databaseVersion = 1;
  late Database database;
  bool didInit = false;

  static DatabaseManager get() {
    return _databaseManager;
  }

  Future init() async {
    final path = join(await getDatabasesPath(), _databaseName);
    database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    didInit = true;
  }

  Future<Database> _getDatabase() async {
    if(!didInit) await init();
    return database;
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
      """
      CREATE TABLE tb_local_user(
        _uid TEXT PRIMARY KEY NOT NULL,
        full_name TEXT NOT NULL,
        email TEXT NOT NULL,
        create_at INTEGER NOT NULL
      );
      """
    );
  }

  Future insertUser(UserEntity user) async {
    var db = await _getDatabase();
    db.transaction((txn) async => {
      await txn.insert(UserEntity.table_name, user.toMap())
    });
  }

  Future<UserEntity?> currentUser() async {
    var db = await _getDatabase();
    var result = await db.rawQuery("SELECT * FROM tb_local_user;");
    if(result.isEmpty)return null;
    return UserEntity.fromMap(result.first);
  }
}
