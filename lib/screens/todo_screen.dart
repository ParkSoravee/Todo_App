import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/new_task/new_task.dart';
import 'package:todo_app/widgets/overall/overalls.dart';
import 'package:todo_app/widgets/sub_title.dart';
import 'package:todo_app/widgets/task_list.dart';

class TodoScreen extends StatelessWidget {
  final appBar = CupertinoNavigationBar(
    border: null,
    padding: EdgeInsetsDirectional.all(15),
    leading: Icon(CupertinoIcons.bars),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Icon(
            CupertinoIcons.search,
            size: 25,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          CupertinoIcons.calendar_today,
          size: 30,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade50,
      appBar: appBar,
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     print(screenW);
            //     print(constraints.maxHeight);
            //   },
            //   child: Icon(Icons.add),
            // ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'What\'s up, Park!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            // SizedBox(
            //   height: 150,
            // ),
            OverAlls(),
            SubTitle(),
            TaskList(),
            // SizedBox(
            //   height: 100,
            // ),
            NewTask(),
          ],
        ),
      ),
    );
  }
}
