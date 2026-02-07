import 'package:flutter/material.dart';
import 'package:sample/data/categories_data.dart';
import 'package:sample/models/category.dart';
import 'package:sample/screen/meals_screen.dart';

import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  void onSelectCategory(BuildContext context) {
    List<Meal> meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealsScreen(meals: meals)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.7),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: () {
            onSelectCategory(context);
          },
          splashColor: Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            key: ValueKey(category.id),
            alignment: Alignment.center,
            child: Text(
              category.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
