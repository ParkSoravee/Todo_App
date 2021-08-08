import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String title;
  final String tag;
  final DateTime? dueDate;
  bool isFinish = false;

  Task(
    this.id,
    this.title,
    this.tag,
    this.dueDate, {
    this.isFinish = false,
  });

  void toggleIsFinish() {
    isFinish = !isFinish;
    notifyListeners();
  }
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  int taskCount(String title) {
    return _tasks.where((task) => task.tag == title).length;
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
