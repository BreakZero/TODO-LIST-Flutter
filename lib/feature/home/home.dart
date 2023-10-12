import 'package:flutter/material.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/feature/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  List<TaskEntity> tasks = [];

  @override
  void initState() {
    super.initState();
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              icon: Icon(Icons.settings)
          ),
        ],
      ),
      body: Center(
        child: Text("Hello world"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          shape: CircleBorder(),
          onPressed: null,
          label: Icon(Icons.add)),
    );
  }
}
