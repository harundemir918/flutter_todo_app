import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';
import '../../../providers/category_provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final categoryData = Provider.of<CategoryProvider>(context);
    final categoryList = categoryData.categories;

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
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                id: categoryList[index].id,
                title: categoryList[index].title,
                color: categoryList[index].color,
              );
            },
          );
        },
      ),
    );
  }
}
