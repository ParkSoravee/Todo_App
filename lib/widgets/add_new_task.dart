import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks.dart';

class AddNewTask extends StatefulWidget {
  final double maxH;

  AddNewTask(this.maxH);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  // bool isAdding = false;
  bool isFocus = false;
  bool showTagSelect = false;
  late double keyboardH;

  void _addTask() {
    if (_controller.text.isEmpty) {
      showTagSelect = false;
      _focusNode.unfocus();
      return;
    }
    Provider.of<Tasks>(context, listen: false)
        .addTask(Task(DateTime.now().toString(), _controller.text));
    showTagSelect = false;
    _focusNode.unfocus();
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print('focus');
      setState(() {
        if (_focusNode.hasFocus) {
          isFocus = true;
          showTagSelect = false;
          // isAdding = true;
        } else {
          isFocus = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
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
          width: (isFocus || showTagSelect) ? screenW : 180,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
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
              ),
              if (isFocus || showTagSelect)
                InkWell(
                  child: Icon(Icons.tag),
                  onTap: () {
                    print('press1');
                    _focusNode.unfocus();
                    setState(() {
                      showTagSelect = true;
                    });
                  },
                ),
              if (isFocus || showTagSelect)
                SizedBox(
                  width: 15,
                ),
              if (isFocus || showTagSelect)
                InkWell(
                  child: Icon(Icons.calendar_today),
                  onTap: () {
                    print(MediaQuery.of(context).size.height);
                  },
                ),
            ],
          ),
        ),
        // if (_focusNode.hasFocus)
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          height: (isFocus || showTagSelect) ? 249 : 0,
          // height: 249,
          // color: Colors.amber,
        ),
      ],
    );
  }
}
