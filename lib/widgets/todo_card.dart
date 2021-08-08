import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tags.dart';
import 'package:todo_app/providers/tasks.dart';

class TodoCard extends StatefulWidget {
  final String id;
  final String title;
  final String tag;
  final DateTime? dueDate;
  final Function(Task task) setDelTask;
  final Function unDelTask;

  TodoCard(
    this.id,
    this.title,
    this.tag,
    this.dueDate,
    this.setDelTask,
    this.unDelTask,
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
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(widget.id),
        background: Card(
          color: Theme.of(context).errorColor,
          clipBehavior: Clip.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.all(1),
            // color: Theme.of(context).errorColor,
            child: Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        onDismissed: (_) {
          widget.setDelTask(
            Task(widget.id, widget.title, widget.tag, widget.dueDate),
          );
          Provider.of<Tasks>(context, listen: false).deleteTask(widget.id);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deleted Task successfully!'),
              backgroundColor: Theme.of(context).errorColor,
              action: SnackBarAction(
                label: 'undo',
                textColor: Colors.grey[100],
                onPressed: () {
                  widget.unDelTask();
                },
                // onPressed: () {},
              ),
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Card(
          // clipBehavior: Clip.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
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
      ),
    );
  }
}
