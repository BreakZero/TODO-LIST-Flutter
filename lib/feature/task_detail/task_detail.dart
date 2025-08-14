import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_list/common/extension.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';

class TaskDetailScreen extends StatelessWidget {
  final int? task_id;

  const TaskDetailScreen({super.key, this.task_id});

  Future<TaskEntity?> _getTaskById() {
    return DatabaseManager.get().taskDao.getTaskById(task_id!);
  }

  @override
  Widget build(BuildContext context) {
    final content = FutureBuilder<TaskEntity?>(
      future: _getTaskById(),
      builder: (BuildContext context, AsyncSnapshot<TaskEntity?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            final task = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: const TextStyle(fontSize: 28)),
                  Text(task.description),
                  const SizedBox(height: 8.0),
                  if (task.attachmentPath != null)
                    Center(
                      child: Image.file(
                        File(task.attachmentPath!),
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            );
          } else {
            return Center(child: Text(context.l10n.placeholder_error_text));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.text_task_detail),
        centerTitle: false,
      ),
      body: SafeArea(child: content),
    );
  }
}