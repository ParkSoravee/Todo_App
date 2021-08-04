import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;

  Task(this.id, this.title);
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('a', 'title'),
    Task('b', 'title'),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
