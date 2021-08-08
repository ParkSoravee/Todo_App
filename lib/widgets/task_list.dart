import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_card.dart';
import '../providers/tasks.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
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
                ),
              ),
            )
          : Center(child: Text('Try add new task...')),
    );
  }
}
