import 'package:flutter/material.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/feature/settings/settings.dart';
import 'package:todo_list/feature/task_add/task_add.dart';

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
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => _TaskItemView(task: tasks[index])),
      floatingActionButton: FloatingActionButton.extended(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()))
                .then((value) => {
                  fetchTasks()
                });
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(task.title),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(task.description),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(task.createAt.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
