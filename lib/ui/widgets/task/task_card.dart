import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatefulWidget {
  final int id;
  final int categoryId;
  final String title;
  final int done;
  final String createDate;

  TaskCard({
    this.id,
    this.categoryId,
    this.title,
    this.done,
    this.createDate,
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var _isDone = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (value) {
          setState(() {
            _isDone = !_isDone;
          });
        },
        value: _isDone,
      ),
      title: Text(widget.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red[800],
        ),
        onPressed: () {
          // Provider.of<TaskProvider>(context, listen: false).removeTask(widget.id);
        },
      ),
    );
  }
}
