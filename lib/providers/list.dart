import 'package:flutter/material.dart';

class Todo {
  final String title;

  Todo(this.title);
}

class TodoList with ChangeNotifier {
  List<Todo> todos = [];

  List<Todo> get todo {
    return [...todos];
  }

  void addTodo(Todo todo) {
    todos.add(todo);
  }
}
