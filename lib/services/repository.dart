import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';
import '../providers/task_provider.dart';

class Repository {
  Future<void> fetchCategories(BuildContext context) async {
    CategoryProvider categoryProvider = Provider.of(context, listen: false);
    await categoryProvider.fetchCategories();
  }

  Future<void> fetchTasks(BuildContext context) async {
    TaskProvider taskProvider = Provider.of(context, listen: false);
    await taskProvider.fetchTasks();
  }

  Future<void> fetchOneTask(BuildContext context, int categoryId) async {
    TaskProvider taskProvider = Provider.of(context, listen: false);
    await taskProvider.fetchTaskByCategory(categoryId);
  }
}