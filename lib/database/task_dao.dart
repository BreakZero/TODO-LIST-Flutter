
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
    var result = await _db.rawQuery("SELECT * FROM tb_task;");
    if (result.isNotEmpty) {
      var tasks = result.map((e) => TaskEntity.fromMap(e)).toList();
      return tasks;
    }
    return List.empty();
  }

  Future<TaskEntity?> getTaskById(int taskId) async {
    var res = await _db.rawQuery("SELECT * FROM tb_task WHERE _id = $taskId;");
    if (res.isNotEmpty) {
      var task = res.map((e) => TaskEntity.fromMap(e)).first;
      return task;
    }
    return null;
  }
}