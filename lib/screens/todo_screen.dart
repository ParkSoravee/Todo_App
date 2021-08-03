import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:todo_app/widgets/todo_card.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(15),
        leading: Icon(CupertinoIcons.bars),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.search,
              size: 25,
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Text(
                'What\'s up, Park!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Container(
                // height: 500,
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) => TodoCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
