import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task_dao.dart';
import 'user_dao.dart';

class DatabaseManager {
  static const _databaseName = "todo_list.db";
  static const _databaseVersion = 3;

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
      onUpgrade: _onUpgrade
    );
    userDao = UserDao(db);
    taskDao = TaskDao(db);
    _database = db;
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
      """
      CREATE TABLE tb_local_user(
        _uid INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT NOT NULL,
        email TEXT NOT NULL,
        create_at INTEGER NOT NULL
      );
      """
    );
    db.execute(
      """
      CREATE TABLE tb_task(
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        deadline INTEGER NOT NULL,
        create_at INTEGER NOT NULL,
        attachment_path TEXT
      );
      """
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("old version === $oldVersion");
    print("new version === $newVersion");
  }

  void close() {
    _database?.close();
  }
}
