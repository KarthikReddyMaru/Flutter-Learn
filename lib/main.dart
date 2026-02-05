import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/widgets/home_screen.dart';

void main() async {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  );

  final themeData = ThemeData().copyWith(
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: colorScheme.primaryContainer,
    ),
    cardTheme: CardThemeData().copyWith(color: colorScheme.secondaryContainer),
    buttonTheme: ButtonThemeData().copyWith(colorScheme: colorScheme),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(home: HomeScreen(), theme: themeData));
}
