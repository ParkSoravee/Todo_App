// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/providers/tasks.dart';

// class NewTaskField extends StatefulWidget {
//   @override
//   _NewTaskFieldState createState() => _NewTaskFieldState();
// }

// class _NewTaskFieldState extends State<NewTaskField> {
//   final _keyboardVisibilityController = KeyboardVisibilityController();
//   final _controller = TextEditingController();
//   final _focusNode = FocusNode();
//   var _isOnFocus = false;

//   void _addTask() {
//     if (_controller.text.isEmpty) {
//       // _showTagSelect = false;
//       _focusNode.unfocus();
//       return;
//     }
//     Provider.of<Tasks>(context, listen: false)
//         .addTask(Task(DateTime.now().toString(), _controller.text));
//     // _showTagSelect = false;
//     _focusNode.unfocus();
//     _controller.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       setState(() {
//         if (_focusNode.hasFocus) {
//           _isOnFocus = true;
//         } else {
//           _isOnFocus = false;
//         }
//       });
//     });
//     _keyboardVisibilityController.onChange.listen((visible) {
//       if (!visible) {
//         _focusNode.unfocus();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenW = MediaQuery.of(context).size.width;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // if (_isOnFocus)
//         //   Row(
//         //     children: [Text('TAG')],
//         //   ),
//         AnimatedContainer(
//           duration: Duration(milliseconds: 500),
//           curve: Curves.ease,
//           width: _isOnFocus ? screenW : 180,
//           // padding: EdgeInsets.symmetric(
//           //   horizontal: 15,
//           // ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.4),
//                 spreadRadius: 0,
//                 blurRadius: 20,
//                 offset: Offset(0, 0), // changes position of shadow
//               ),
//             ],
//           ),
//           child: TextField(
//             focusNode: _focusNode,
//             controller: _controller,
//             textInputAction: TextInputAction.done,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
//               labelText: 'Write a new task',
//               floatingLabelBehavior: FloatingLabelBehavior.never,
//             ),
//             onEditingComplete: _addTask,
//             // onSubmitted: _addTask,
//           ),
//         ),
//       ],
//     );
//   }
// }
