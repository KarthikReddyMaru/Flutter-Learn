import 'package:flutter/material.dart';
import 'package:sample/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(category.id),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            category.color.withValues(alpha: 0.7),
            category.color.withValues(alpha: 0.9),
          ],
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        category.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
