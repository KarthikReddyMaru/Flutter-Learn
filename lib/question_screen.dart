import 'package:flutter/material.dart';
import 'package:sample/data/question_data.dart';
import 'package:sample/shared/option_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final question = questions[0];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question.text, style: TextStyle(color: Colors.white)),
        SizedBox(height: 50, width: double.infinity),
        OptionButton(onPick: () {}, widget: Text(question.options[0])),
        OptionButton(onPick: () {}, widget: Text(question.options[1])),
        OptionButton(onPick: () {}, widget: Text(question.options[2])),
        OptionButton(onPick: () {}, widget: Text(question.options[3])),
      ],
    );
  }
}
