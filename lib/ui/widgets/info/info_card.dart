import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
        vertical: screenHeight * 0.025,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 50,
          ),
          SizedBox(
            width: screenWidth * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Harun Demir",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                ),
                child: Text(
                  "Software Engineer",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
