import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/app_bar/todo_app_bar.dart';
import '../widgets/info/info_card.dart';
import '../widgets/date_and_task_count/date_and_task_count.dart';
import '../widgets/category/category_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
            DateAndTaskCount(),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
