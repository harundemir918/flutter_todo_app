import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar/todo_app_bar.dart';
import '../widgets/task/task_card.dart';
import '../../providers/task_provider.dart';
import '../../services/repository.dart';

class TasksScreen extends StatefulWidget {
  static const routeName = "/tasksScreen";

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int categoryId;
  Repository repository = Repository();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
    super.initState();
  }

  _callApi(_) {
    categoryId = ModalRoute.of(context).settings.arguments as int;
    repository.fetchOneTask(context, categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(
        title: "To-Do App",
      ),
      body: Container(
        child: Consumer<TaskProvider>(
          builder: (_, TaskProvider taskProvider, __) {
            return ListView.builder(
              itemCount: taskProvider.categoryTaskCount,
              itemBuilder: (context, index) {
                OneTask oneTask = taskProvider.task.tasks[index];
                return TaskCard(
                  id: int.parse(oneTask.id),
                  categoryId: categoryId,
                  title: oneTask.title,
                  done: int.parse(oneTask.done),
                  createDate: oneTask.createDate,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
