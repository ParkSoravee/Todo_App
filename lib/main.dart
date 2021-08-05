import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tags.dart';
import 'package:todo_app/providers/tasks.dart';

import 'screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Tasks(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Tags(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'Lato',
        ),
        home: TodoScreen(),
      ),
    );
  }
}
