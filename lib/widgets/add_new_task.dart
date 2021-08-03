import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool isExpanded = false;
  bool isFocus = false;

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
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
      child: TextField(
        style: TextStyle(fontSize: 19),
        // textAlignVertical: TextAlignVertical.top,
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
          labelText: 'Write a new task',
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
