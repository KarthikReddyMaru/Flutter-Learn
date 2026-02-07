import 'package:flutter/material.dart';
import 'package:sample/models/meal.dart';
import 'package:sample/screen/meals_container.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MealsContainer(meals: meals),
    );
  }
}
