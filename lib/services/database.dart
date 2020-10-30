import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/category.dart';
import '../models/task.dart';

class Database {
  Future<Category> getCategories() async {
    var response = await http.get("$apiUrl/categories.php");
    if (response.statusCode == 200) {
      return Category.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Failed to load categories.");
    }
  }

  Future<Task> getTasks() async {
    var response = await http.get("$apiUrl/tasks.php");
    if (response.statusCode == 200) {
      return Task.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Failed to load tasks.");
    }
  }

  Future<Task> getTaskByCategory(int categoryId) async {
    var response = await http.get("$apiUrl/tasks.php?category_id=$categoryId");
    if (response.statusCode == 200) {
      return Task.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception("Failed to load tasks.");
    }
  }
}