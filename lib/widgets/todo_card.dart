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
                isFinish ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
              SizedBox(width: 12),
              Text(
                'Text',
                style: TextStyle(
                  fontSize: 17,
                  decoration: isFinish ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
