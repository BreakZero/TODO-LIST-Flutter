import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8.0)),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              decoration: InputDecoration(
                  enabled: false,
                  suffixIcon: Icon(
                    Icons.calendar_month,
                  ),
                  border: OutlineInputBorder()),
            ),
            Expanded(
              child: IconButton(onPressed: null, icon: Icon(Icons.camera_alt), iconSize: 100,),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.0)),
                onPressed: null,
                child: Text("ADD TODO"))
          ],
        ),
      ),
    );
  }
}
