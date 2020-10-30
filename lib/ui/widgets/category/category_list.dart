import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';
import '../../../models/category.dart';
import '../../../providers/category_provider.dart';
import '../../../services/repository.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Repository repository = Repository();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
    super.initState();
  }

  _callApi(_) {
    repository.fetchCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer<CategoryProvider>(
        builder: (_, CategoryProvider categoryProvider, __) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryProvider.categoryCount,
            itemBuilder: (context, index) {
              OneCategory category = categoryProvider.category.categories[index];
              return CategoryCard(
                id: int.parse(category.id),
                title: category.title,
                color: category.color,
              );
            },
          );
        },
      ),
    );
  }
}
