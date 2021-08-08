import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tags.dart';
import 'package:todo_app/providers/tasks.dart';

class TodoCard extends StatelessWidget {
  // final String id;
  // final String title;
  // final String tag;
  // final DateTime? dueDate;
  // final bool isFinish;

  final Function(Task task) setDelTask;
  final Function unDelTask;

  TodoCard(
    // this.id,
    // this.title,
    // this.tag,
    // this.dueDate,
    // this.isFinish,
    this.setDelTask,
    this.unDelTask,
  );

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    final tagColor =
        Provider.of<Tags>(context, listen: false).getColor(task.tag);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(task.id),
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
          setDelTask(
            Task(task.id, task.title, task.tag, task.dueDate,
                isFinish: task.isFinish),
          );
          Provider.of<Tasks>(context, listen: false).deleteTask(task.id);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deleted Task successfully!'),
              backgroundColor: Theme.of(context).errorColor,
              action: SnackBarAction(
                label: 'undo',
                textColor: Colors.grey[100],
                onPressed: () {
                  unDelTask();
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
                  onTap: task.toggleIsFinish,
                  child: Icon(
                    task.isFinish
                        ? CupertinoIcons.checkmark_square_fill
                        : CupertinoIcons.square_fill,
                    color: task.isFinish
                        ? Theme.of(context).primaryColor
                        : Colors.black12.withBlue(50),
                    size: 28,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    task.title,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      decoration:
                          task.isFinish ? TextDecoration.lineThrough : null,
                      color: task.isFinish ? Colors.black54 : Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: task.tag != 'other'
                      ? Text(
                          task.tag,
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
