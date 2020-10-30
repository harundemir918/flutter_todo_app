import 'package:flutter/material.dart';

import '../../../constants.dart';

class ToDoAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  ToDoAppBar({this.title}) : preferredSize = Size.fromHeight(75.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
