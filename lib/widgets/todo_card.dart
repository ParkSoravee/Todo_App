import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          setState(() {
            isFinish = !isFinish;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                isFinish
                    ? CupertinoIcons.checkmark_alt_circle_fill
                    // : Icons.check_box_outline_blank_rounded,
                    : CupertinoIcons.circle,
                color: isFinish
                    ? Theme.of(context).primaryColor.withAlpha(200)
                    : Theme.of(context).primaryColor,
                size: 28,
              ),
              SizedBox(width: 20),
              Text(
                'Text',
                style: TextStyle(
                  fontSize: 17,
                  decoration: isFinish ? TextDecoration.lineThrough : null,
                  color: isFinish ? Colors.black54 : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
