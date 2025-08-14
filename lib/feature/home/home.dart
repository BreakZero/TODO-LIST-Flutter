import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/common/extension.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/feature/settings/settings.dart';
import 'package:todo_list/feature/task_add/task_add.dart';
import 'package:todo_list/feature/task_detail/task_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  List<TaskEntity> tasks = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  void fetchTasks() async {
    DatabaseManager.get().taskDao.allTasks().then((value) => {
          setState(() {
            tasks.clear();
            tasks.addAll(value);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "TO DO LIST",
          style: TextStyle(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: tasks.isEmpty
          ? _EmptyView()
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) =>
                  _TaskItemView(task: tasks[index]),
            ),
      floatingActionButton: FloatingActionButton.extended(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTaskScreen()))
                .then((value) => {fetchTasks()});
          },
          label: Icon(Icons.add)),
    );
  }
}

class _TaskItemView extends StatelessWidget {
  final TaskEntity task;
  const _TaskItemView({required this.task});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat.yMMMd(context.l10n.localeName)
        .format(DateTime.fromMicrosecondsSinceEpoch(task.createAt));

    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskDetailScreen(
                      task_id: task.id,
                    )))
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    task.title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(task.description, maxLines: 3, overflow: TextOverflow.ellipsis,),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n.dueDate(dateStr),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            context.l10n.placeholder_empty_text,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
