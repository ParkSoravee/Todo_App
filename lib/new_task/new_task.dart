import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/new_task/tags/tag_button.dart';
import 'package:todo_app/providers/tags.dart';
import 'package:todo_app/providers/tasks.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _keyboardVisibilityController = KeyboardVisibilityController();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  var _isOnFocus = false;
  var _isExtend = false;

  String _tag = 'other';
  DateTime? _dueDate;

  void _addTask() {
    if (_controller.text.isEmpty) {
      // _showTagSelect = false;
      _dueDate = null;
      _focusNode.unfocus();
      return;
    }

    Provider.of<Tasks>(context, listen: false).addTask(
      Task(
        DateTime.now().toString(),
        _controller.text,
        _tag, //! save Tag Object
        _dueDate,
      ),
    );
    // _showTagSelect = false;
    _focusNode.unfocus();
    _controller.clear();
    _dueDate = null;
    _tag = 'other';
  }

  void selectTag(String tag) {
    setState(() {
      _tag = tag;
    });
  }

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      _dueDate = selectedDate;
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _isOnFocus = true;
          _isExtend = true;
        } else {
          _isOnFocus = false;
          Timer(Duration(milliseconds: 400), () {
            setState(() {
              _isExtend = false;
            });
          });
        }
      });
    });
    _keyboardVisibilityController.onChange.listen((visible) {
      if (!visible) {
        _focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final tags = Provider.of<Tags>(context, listen: false).tags;
    return Container(
      // color: Colors.blue,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            width: _isOnFocus ? screenW : 180,
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(bottom: 15, left: 15, right: 5),
                      labelText: 'Write a new task',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    onEditingComplete: _addTask,
                  ),
                ),
                if (_isOnFocus)
                  TextButton(
                    onPressed: _selectDate,
                    child: _dueDate == null
                        ? Icon(Icons.calendar_today)
                        : Text(
                            DateFormat('d/M').format(_dueDate!),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // if (_isOnFocus)
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            // width: double.infinity,
            height: _isExtend ? 30 : 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              opacity: _isOnFocus ? 1 : 0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: tags.length,
                itemBuilder: (ctx, index) => TagButton(
                  tags[index].title,
                  tags[index].color,
                  tags[index].title == _tag ? true : false,
                  selectTag,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
