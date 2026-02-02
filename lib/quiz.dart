import 'package:flutter/material.dart';
import 'package:sample/question_screen.dart';

import 'shared/gradient_container.dart';
import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var optionsSelected = [];
  String activeWidget = 'home_screen';

  void changeActiveWidget() {
    setState(() {
      activeWidget = 'question_screen';
    });
  }

  void onOptionPick(String option) {
    optionsSelected.add(option);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer.purple(
          widget: activeWidget == 'home_screen'
              ? HomeScreen(changeActiveWidget)
              : QuestionScreen(onOptionPick: onOptionPick),
        ),
      ),
    );
  }
}
