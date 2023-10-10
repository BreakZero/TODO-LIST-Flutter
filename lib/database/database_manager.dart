import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task_dao.dart';
import 'user_dao.dart';

class DatabaseManager {
  static const _databaseName = "todo_list.db";
  static const _databaseVersion = 1;

  static final DatabaseManager _databaseManager = DatabaseManager._internal();

  DatabaseManager._internal();
  Database? _database;

  late UserDao userDao;
  late TaskDao taskDao;

  static DatabaseManager get() {
    return _databaseManager;
  }

  Future init() async {
    final path = join(await getDatabasesPath(), _databaseName);
    final db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    userDao = UserDao(db);
    taskDao = TaskDao(db);
    _database = db;
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

  void close() {
    _database?.close();
  }
}
