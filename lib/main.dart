import 'package:flutter/material.dart';
import 'package:sample/Dice.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blueAccent, Colors.blue]),
          ),
          child: Center(
            child: Dice(),
          ),
        ),
      ),
    ),
  );
}
