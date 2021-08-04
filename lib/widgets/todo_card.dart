import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatefulWidget {
  final String id;
  final String title;

  TodoCard(this.id, this.title);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isFinish = !isFinish;
                  });
                },
                child: Icon(
                  isFinish
                      ? CupertinoIcons.checkmark_square_fill
                      : CupertinoIcons.square_fill,
                  color: isFinish
                      ? Theme.of(context).primaryColor
                      : Colors.black12,
                  size: 28,
                ),
              ),
              SizedBox(width: 20),
              Text(
                widget.title,
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
