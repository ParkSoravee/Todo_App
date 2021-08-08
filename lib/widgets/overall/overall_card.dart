import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks.dart';

class OverallCard extends StatelessWidget {
  final String title;
  final Color color;

  OverallCard(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final listCount = Provider.of<Tasks>(context).taskCount(title);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      color: color,
      child: Container(
        padding: EdgeInsets.all(10),
        // color: Colors.amber,
        width: 100,
        alignment: Alignment.center,
        // height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              listCount.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
