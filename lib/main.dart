import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'ui/screens/main_screen.dart';
import 'ui/screens/tasks_screen.dart';
import 'providers/category_provider.dart';
import 'providers/task_provider.dart';
import 'services/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: {
          TasksScreen.routeName: (context) => TasksScreen(),
        },
      ),
    );
  }
}
