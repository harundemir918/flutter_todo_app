import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar/todo_app_bar.dart';
import '../widgets/task/task_card.dart';
import '../../providers/task_provider.dart';

class TasksScreen extends StatefulWidget {
  static const routeName = "/tasksScreen";

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments as int;
    final taskData = Provider.of<TaskProvider>(context);
    final taskList = taskData.getTaskById(categoryId);
    return Scaffold(
      appBar: ToDoAppBar(
        title: "To-Do App",
      ),
      body: Container(
        child: Consumer<TaskProvider>(
          builder: (_, TaskProvider taskProvider, __) {
            return ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) => TaskCard(
                id: taskList[index].id,
                categoryId: categoryId,
                title: taskList[index].title,
                done: int.parse(taskList[index].done),
                createDate: taskList[index].createDate,
              ),
            );
          },
        ),
      ),
    );
  }
}
