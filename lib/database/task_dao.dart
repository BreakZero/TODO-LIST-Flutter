import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database/tables.dart';

class TaskDao {
  final Database _db;

  const TaskDao(this._db);

  Future insertTask(TaskEntity task) async {
    await _db.insert(TaskEntity.table_name, task.toMap());
  }

  Future<List<TaskEntity>> allTasks() async {
    final result = await _db.query(TaskEntity.table_name);
    if (result.isNotEmpty) {
      var tasks = result.map((e) => TaskEntity.fromMap(e)).toList();
      return tasks;
    }
    return [];
  }

  Future<TaskEntity?> getTaskById(int taskId) async {
    final res = await _db.query(
      TaskEntity.table_name,
      where: "${TaskEntity.col_id} = ?",
      whereArgs: [taskId],
    );
    if (res.isNotEmpty) {
      return TaskEntity.fromMap(res.first);
    }
    return null;
  }

  Future<int> deleteTask(int taskId) async {
    return await _db.delete(
      TaskEntity.table_name,
      where: '${TaskEntity.col_id} = ?',
      whereArgs: [taskId],
    );
  }
}
