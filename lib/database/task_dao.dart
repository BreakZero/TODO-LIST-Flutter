
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/tables.dart';

class TaskDao {
  final Database _db;

  const TaskDao(this._db);

  Future insertTask(TaskEntity task) async {
    _db.transaction((txn) async => {
      await txn.insert(TaskEntity.table_name, task.toMap())
    });
  }

  Future<List<TaskEntity>> allTasks() async {
    return List.empty();
  }
}