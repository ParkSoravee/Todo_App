import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_card.dart';
import '../providers/tasks.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Task? deleteTask;

  void setDeleteTask(Task task) {
    deleteTask = Task(task.id, task.title, task.tag, task.dueDate);
    // print(deleteTask!.title);
  }

  void unDeleteTask() {
    if (deleteTask == null) return;
    Provider.of<Tasks>(context, listen: false).addTask(
      Task(
        deleteTask!.id,
        deleteTask!.title,
        deleteTask!.tag,
        deleteTask!.dueDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasks;
    return Expanded(
      child: tasks.length > 0
          ? Container(
              // padding: EdgeInsets.symmetric(horizontal: 18),
              margin: EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (ctx, index) => TodoCard(
                  tasks[index].id,
                  tasks[index].title,
                  tasks[index].tag,
                  tasks[index].dueDate,
                  setDeleteTask,
                  unDeleteTask,
                ),
              ),
            )
          : Center(child: Text('Try add new task...')),
    );
  }
}
