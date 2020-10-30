import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(
      id: 1,
      title: "Proje",
      color: "FF0000",
      createDate: "2020-10-30 00:00:00",
    ),
    Category(
      id: 2,
      title: "Alışveriş",
      color: "00FF00",
      createDate: "2020-10-30 00:00:00",
    ),
  ];

  List<Category> get categories {
    return [..._categories];
  }
}