import 'package:flutter/material.dart';
import 'package:todo_app/new_task/new_task_field.dart';
import 'package:todo_app/providers/tasks.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskTitle = '';

  void addTaskTitle(String newTask) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      height: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NewTaskField(),
        ],
      ),
    );
  }
}
