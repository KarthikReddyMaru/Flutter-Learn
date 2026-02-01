import 'package:flutter/material.dart';

import 'dart:math';

import 'package:sample/ImageContainer.dart';

final random = Random();

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<Dice> {
  String diceImagePath = 'assets/images/dice-1.png';

  void onRoll() {
    final randomRoll = random.nextInt(6) + 1;
    setState(() {
      diceImagePath = 'assets/images/dice-$randomRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageContainer(path: diceImagePath),
        SizedBox(height: 50),
        TextButton(
          onPressed: onRoll,
          child: Text(
            "Roll",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
