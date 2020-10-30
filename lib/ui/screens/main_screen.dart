import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../widgets/app_bar/todo_app_bar.dart';
import '../widgets/info/info_card.dart';
import '../widgets/date_and_task_count/date_and_task_count.dart';
import '../widgets/category/category_list.dart';
import '../../services/repository.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Repository repository = Repository();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
    super.initState();
  }

  _callApi(_) {
    repository.fetchTasks(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: ToDoAppBar(title: appName),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(),
            DateAndTaskCount(Provider.of<TaskProvider>(context).categoryTaskCount),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
