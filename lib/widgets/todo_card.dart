import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tags.dart';

class TodoCard extends StatefulWidget {
  final String id;
  final String title;
  final String tag;
  final DateTime? dueDate;

  TodoCard(
    this.id,
    this.title,
    this.tag,
    this.dueDate,
  );

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    final tagColor =
        Provider.of<Tags>(context, listen: false).getColor(widget.tag);
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
                      : Colors.black12.withBlue(50),
                  size: 28,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  widget.title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 17,
                    decoration: isFinish ? TextDecoration.lineThrough : null,
                    color: isFinish ? Colors.black54 : Colors.black,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: widget.tag != 'other'
                    ? Text(
                        widget.tag,
                        style: TextStyle(
                          color: tagColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : null, //TODO : Tag here and color also
              ),
            ],
          ),
        ),
      ),
    );
  }
}
