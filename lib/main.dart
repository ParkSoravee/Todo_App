import 'package:flutter/material.dart';

import 'screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Lato',
      ),
      home: TodoScreen(),
    );
  }
}
