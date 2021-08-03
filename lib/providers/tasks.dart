import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;

  Task(this.id, this.title);
}

class Tasks with ChangeNotifier {
  List<Task> tasks = [];

  List<Task> get todo {
    return [...tasks];
  }

  void addTodo(Task task) {
    tasks.add(task);
  }
}
