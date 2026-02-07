import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/provider/favorites_provider.dart';

import '../models/meal.dart';

class MealItem extends ConsumerWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              final isAdded = ref
                  .read(favoritesProvider.notifier)
                  .toggleMeal(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              if (isAdded) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Added to fav")));
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Removed from fav")));
              }
            },
            enableFeedback: true,
          ),
        ],
      ),
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
