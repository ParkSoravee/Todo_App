import 'package:flutter/material.dart';
import 'package:todo_app/providers/tags.dart';

class Task {
  final String id;
  final String title;
  final String tag;
  final DateTime? dueDate;

  Task(
    this.id,
    this.title,
    this.tag,
    this.dueDate,
  );
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('a', 'title', 'study', null),
    Task('a', 'title', 'study', DateTime.now()),
    Task('a', 'title', 'study', DateTime.now()),
    Task('a', 'title', 'study', DateTime.now()),
    Task('a', 'title', 'study', DateTime.now()),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
