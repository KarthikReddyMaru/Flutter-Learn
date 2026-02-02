import 'package:flutter/material.dart';
import 'package:sample/data/question_data.dart';
import 'package:sample/question_screen.dart';
import 'package:sample/results_screen.dart';

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
  List<String> optionsSelected = [];
  String activeWidget = 'home_screen';

  void changeActiveWidget() {
    setState(() {
      activeWidget = 'question_screen';
    });
  }

  void onOptionPick(String option) {
    optionsSelected.add(option);

    if (optionsSelected.length == questions.length) {
      setState(() {
        activeWidget = 'results-screen';
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    Widget widget;
    if (activeWidget == 'home_screen') {
      widget = HomeScreen(changeActiveWidget);
    } else if (activeWidget == 'question_screen') {
      widget = QuestionScreen(onOptionPick: onOptionPick);
    } else {
      widget = ResultsScreen(chosenOptions: optionsSelected);
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer.purple(
          widget: widget,
        ),
      ),
    );
  }
}
