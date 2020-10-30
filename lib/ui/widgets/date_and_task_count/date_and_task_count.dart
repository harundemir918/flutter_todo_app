import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/task_provider.dart';
import '../../../models/task.dart';

class DateAndTaskCount extends StatefulWidget {
  final int taskCount;

  DateAndTaskCount(this.taskCount);

  @override
  _DateAndTaskCountState createState() => _DateAndTaskCountState();
}

class _DateAndTaskCountState extends State<DateAndTaskCount> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String dateTime = DateFormat.yMMMd().format(new DateTime.now());

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
        vertical: screenHeight * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today is $dateTime.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: screenHeight * 0.01,),
          Consumer<TaskProvider>(
            builder: (context, task, _) => Text(
              "You have ${task.categoryTaskCount} new tasks.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
