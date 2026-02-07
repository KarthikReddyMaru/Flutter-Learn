import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage("assets/Loading_icon.gif"),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 300),
            ),
            SizedBox(height: 5),
            Text(
              meal.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
