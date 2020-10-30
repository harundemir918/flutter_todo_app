import 'package:flutter/material.dart';

import '../services/database.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  Task _task = Task();
  Database _database = Database();

  Task get task => _task;

  int get categoryTaskCount => _task.count;

  set task(Task task) {
    _task = task;
    notifyListeners();
  }

  Future<void> fetchTasks() async {
    task = await _database.getTasks();
  }

  Future<void> fetchTaskByCategory(int categoryId) async {
    task = await _database.getTaskByCategory(categoryId);
  }
}