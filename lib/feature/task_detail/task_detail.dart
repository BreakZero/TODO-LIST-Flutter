
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_list/common/extension.dart';
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: TextStyle(fontSize:28)),
                  Text(task.description),
                  SizedBox(height: 8.0,),
                  task.attachmentPath != null ? Image.file(File(task.attachmentPath!)) : Spacer()
                ],
              ),
            );
          } else {
            return Center(child: Text(context.l10n.placeholder_error_text),);
          }
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      });

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.text_task_detail), centerTitle: false,),
      body: content,
    );
  }
}