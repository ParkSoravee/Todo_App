import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/widgets/task_list.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   height: 200,
      //   child: Text('ddd'),
      // ),
      appBar: CupertinoNavigationBar(
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
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            child: Text(
              'What\'s up, Park!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              'TODAY\'S TASKS',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TaskList(),
        ],
      ),
    );
  }
}
