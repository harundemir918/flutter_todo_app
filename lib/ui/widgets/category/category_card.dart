import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../screens/tasks_screen.dart';
import '../../../providers/task_provider.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final String title;
  final String color;

  CategoryCard({
    this.id,
    this.title,
    this.color,
  });

  getTasksScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      TasksScreen.routeName,
      arguments: id,
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getTasksScreen(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                color: hexToColor(color),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<TaskProvider>(
                          builder: (context, task, _) => Text(
                            "Total: ${task.getTaskById(id).length} Task",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "New: 2 Task",
                          style: TextStyle(
                            color: lightGrayColor,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Done: 1 Task",
                          style: TextStyle(
                            color: lightGrayColor,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        width: 200,
                        lineHeight: 14.0,
                        percent: 0.33,
                        backgroundColor: Colors.grey,
                        progressColor: hexToColor(color),
                      ),
                      Text("33%"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
