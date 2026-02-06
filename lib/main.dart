import 'package:flutter/material.dart';
import 'package:sample/screen/categories_screen.dart';

void main() {
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);
  final themeData = ThemeData(
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: colorScheme.primaryContainer,
    ),
  );
  runApp(MaterialApp(home: CategoriesScreen(), theme: themeData));
}