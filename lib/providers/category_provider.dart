import 'package:flutter/material.dart';

import '../services/database.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  Category _category = Category();
  Database _database = Database();

  Category get category => _category;

  int get categoryCount => _category.count;

  set category(Category category) {
    _category = category;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    category = await _database.getCategories();
  }
}