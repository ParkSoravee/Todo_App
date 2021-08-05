// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/providers/tasks.dart';

// class AddNewTask extends StatefulWidget {
//   final double maxH;

//   AddNewTask(this.maxH);

//   @override
//   _AddNewTaskState createState() => _AddNewTaskState();
// }

// class _AddNewTaskState extends State<AddNewTask> {
//   var _keyboardVisibilityController = KeyboardVisibilityController();
//   final _controller = TextEditingController();
//   final _focusNode = FocusNode();
//   // bool isAdding = false;
//   bool _isFocus = false;
//   bool _showTagSelect = false;
//   // late double _keyboardH;

//   void _addTask() {
//     if (_controller.text.isEmpty) {
//       _showTagSelect = false;
//       _focusNode.unfocus();
//       return;
//     }
//     Provider.of<Tasks>(context, listen: false)
//         .addTask(Task(DateTime.now().toString(), _controller.text));
//     _showTagSelect = false;
//     _focusNode.unfocus();
//     _controller.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       print('focus');
//       setState(() {
//         if (_focusNode.hasFocus) {
//           _isFocus = true;
//           _showTagSelect = false;
//           // isAdding = true;
//         } else {
//           _isFocus = false;
//         }
//       });
//       _keyboardVisibilityController.onChange.listen((visible) {
//         if (visible)
//           print('keyboard on');
//         else {
//           print('keyboard off');
//           // if (_controller.text.isEmpty) {
//           _focusNode.unfocus();
//           _controller.clear();
//           _isFocus = false;
//           // }
//         }
//       });
//     });
//   }

// //TODO: add border radius
//   @override
//   Widget build(BuildContext context) {
//     final screenW = MediaQuery.of(context).size.width;
//     return Container(
//       color: Colors.blue,
//       width: double.infinity,
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//           // color: Colors.amber,
//           // borderRadius: BorderRadius.only(
//           //   topLeft: Radius.circular(5),
//           //   topRight: Radius.circular(5),
//           // ),
//           ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (_isFocus)
//             Container(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: Text('tag'),
//               width: double.infinity,
//             ),
//           AnimatedContainer(
//             duration: Duration(milliseconds: 500),
//             curve: Curves.ease,
//             // alignment: Alignment.center,
//             decoration: BoxDecoration(
//               // color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.4),
//                   spreadRadius: 0,
//                   blurRadius: 20,
//                   offset: Offset(0, 0), // changes position of shadow
//                 ),
//               ],
//             ),
//             height: 50,
//             width: (_isFocus || _showTagSelect) ? screenW : 180,
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 5,
//               top: 0,
//             ),
//             // margin: EdgeInsets.only(
//             //   top: 20,
//             //   left: 20,
//             //   right: 20,
//             //   bottom: 30,
//             // ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: TextField(
//                     // style: TextStyle(fontSize: 19),
//                     // textAlignVertical: TextAlignVertical.top,
//                     focusNode: _focusNode,
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       // labelStyle: TextStyle(fontSize: 18),
//                       border: InputBorder.none,
//                       labelText: 'Write a new task',
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                     ),
//                     onEditingComplete: _addTask,
//                   ),
//                 ),
//                 if (_isFocus || _showTagSelect)
//                   InkWell(
//                     child: Icon(Icons.calendar_today),
//                     onTap: () {
//                       print(MediaQuery.of(context).size.height);
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
