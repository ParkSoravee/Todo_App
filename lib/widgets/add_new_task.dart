import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool isExpanded = false;
  bool isFocus = false;

  void _addTask() {
    if (_controller.text.isEmpty) {
      _focusNode.unfocus();
      return;
    }
    Provider.of<Tasks>(context, listen: false)
        .addTask(Task(DateTime.now().toString(), _controller.text));
    _focusNode.unfocus();
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          isFocus = true;
        } else {
          isFocus = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: 50,
      width: isFocus ? screenW : 180,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 5,
        top: 0,
      ),
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 30,
      ),
      child: TextField(
        // style: TextStyle(fontSize: 19),
        // textAlignVertical: TextAlignVertical.top,
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          // labelStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
          labelText: 'Write a new task',
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        onEditingComplete: _addTask,
      ),
    );
  }
}
