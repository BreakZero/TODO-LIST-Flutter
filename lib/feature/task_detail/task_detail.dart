
import 'package:flutter/material.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';

class TaskDetailScreen extends StatelessWidget {
  @required
  final task_id;

  TaskDetailScreen({super.key, this.task_id});

  Future<TaskEntity?> _getTaskById() {
    return DatabaseManager.get().taskDao.getTaskById(task_id);
  }

  @override
  Widget build(BuildContext context) {
    final content = FutureBuilder(
      future: _getTaskById(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final task = snapshot.data as TaskEntity;
            return Center(child: Text(task.title));
          } else {
            return Text("Error...");
          }
        } else {
          return CircularProgressIndicator();
        }
      });

    return content;
  }
}