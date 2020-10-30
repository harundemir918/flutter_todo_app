import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [
    Task(
      id: 1,
      categoryId: 1,
      title: "Ekleme yapılacak.",
      done: "0",
      createDate: "2020-10-30 00:00:00",
    ),
    Task(
      id: 2,
      categoryId: 1,
      title: "To-do App yapılacak.",
      done: "0",
      createDate: "2020-10-30 00:00:00",
    ),
    Task(
      id: 3,
      categoryId: 2,
      title: "1 kg elma alınacak.",
      done: "0",
      createDate: "2020-10-30 00:00:00",
    ),
    Task(
      id: 4,
      categoryId: 2,
      title: "2 kg armut alınacak.",
      done: "0",
      createDate: "2020-10-30 00:00:00",
    ),
    Task(
      id: 5,
      categoryId: 1,
      title: "Düzenlemeler yapılacak",
      done: "0",
      createDate: "2020-10-30 00:00:00",
    ),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  getTaskById(int categoryId) {
    return [..._tasks.where((task) => task.categoryId == categoryId).toList()];
  }
}
