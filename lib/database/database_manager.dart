import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task_dao.dart';
import 'user_dao.dart';

class DatabaseManager {
  static const _databaseName = "todo_list.db";
  static const _databaseVersion = 4;

  static final DatabaseManager _instance = DatabaseManager._internal();

  DatabaseManager._internal();

  Database? _database;
  late UserDao userDao;
  late TaskDao taskDao;

  static DatabaseManager get instance => _instance;

  static DatabaseManager get() => _instance;

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
        attachment_path TEXT,
        status INTEGER NOT NULL DEFAULT 0
      );
      """
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("old version === $oldVersion");
    print("new version === $newVersion");
    if (oldVersion < 4) {
      // Add the status column if upgrading from a version before 4
      await db.execute(
        "ALTER TABLE tb_task ADD COLUMN status INTEGER NOT NULL DEFAULT 0;"
      );
    }
  }

  void close() {
    _database?.close();
  }
}
