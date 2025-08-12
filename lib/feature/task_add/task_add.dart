import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/database/task_status.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  late Widget image;
  File? _image;
  DateTime? _deadline;

  Future getImageFromGallery() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_image != null) {
      image = InkWell(
        onTap: () {
          getImageFromGallery();
        },
        child: Image.file(_image!),
      );
    } else {
      image = Center(
        child: IconButton(
          onPressed: () {
            getImageFromGallery();
          },
          icon: Icon(Icons.camera_alt),
          iconSize: 100,
        ),
      );
    }
    return Scaffold(

      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(16.0),
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
              controller: deadlineController,
              decoration: InputDecoration(
                  enabled: true,
                  suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.utc(2033));
                        if (pickedDate != null) {

                          String date = DateFormat.yMd().format(pickedDate);
                          setState(() {
                            deadlineController.text = date;
                            _deadline = pickedDate;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.calendar_month,
                      )),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(child: image),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48.0)),
                onPressed: () {
                  String? errorMsg = formValidator();
                  if (errorMsg == null) {
                    save(_deadline ?? DateTime.now());
                    Navigator.pop(context);
                  } else {
                    final snackBar = SnackBar(content: Text(errorMsg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text("ADD TODO"))
          ],
        ),
      ),),
    );
  }

  String? formValidator() {
    String? errorMsg;
    if (titleController.text.isEmpty) {
      errorMsg = "title can not be null";
    } else if (descController.text.isEmpty) {
      errorMsg = "description can not be null";
    } else if (deadlineController.text.isEmpty) {
      errorMsg = "please choose the deadline";
    }
    return errorMsg;
  }

  void save(DateTime deadline) async {
    final task = TaskEntity(
        id: null,
        title: titleController.text,
        description: descController.text,
        createAt: DateTime.now().microsecondsSinceEpoch,
        deadline: deadline.microsecondsSinceEpoch,
        attachmentPath: _image?.path,
        status: TaskStatus.notStarted);
        print(task.toString());
    DatabaseManager.get().taskDao.insertTask(task);
  }
}
