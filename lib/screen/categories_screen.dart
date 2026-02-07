import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/categories_data.dart';
import 'package:sample/provider/category_provider.dart';
import 'package:sample/widget/category_item.dart';
import 'package:sample/widget/drawer_widget.dart';
import 'package:sample/widget/navigation_bar_item.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Meals")),
      drawer: DrawerWidget(),
      bottomNavigationBar: NavigationBarWidget(),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 30,
          childAspectRatio: 3 / 2,
        ),
        children: [
          ...categories.map((category) => CategoryItem(category: category)),
        ],
      ),
    );
  }
}
