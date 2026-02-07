import 'package:flutter/material.dart';
import 'package:sample/data/categories_data.dart';
import 'package:sample/widget/category_item.dart';
import 'package:sample/widget/navigation_bar_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals")),
      bottomNavigationBar: NavigationBarItem(),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 30,
          childAspectRatio: 3 / 2,
        ),
        children: [
          ...availableCategories.map(
            (category) => CategoryItem(category: category),
          ),
        ],
      ),
    );
  }
}
