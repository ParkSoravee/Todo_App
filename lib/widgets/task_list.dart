import 'package:flutter/material.dart';

import 'todo_card.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 18),
        margin: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, index) => TodoCard(),
        ),
      ),
    );
  }
}
