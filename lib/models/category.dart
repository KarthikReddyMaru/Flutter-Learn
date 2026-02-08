import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;

  const Category(this.name, this.color);

  @override
  String toString() {
    return 'Category{name: $name, color: $color}';
  }
}

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  pieces,
  convenience,
  hygiene,
  other,
}
