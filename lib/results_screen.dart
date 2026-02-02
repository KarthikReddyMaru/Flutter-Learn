import 'package:flutter/material.dart';
import 'package:sample/data/question_data.dart';
import 'package:sample/shared/result_container.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenOptions});

  final List<String> chosenOptions;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenOptions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].options[0],
        'user_answer': chosenOptions[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Expanded allows the list to take remaining height
            // But since this is likely inside a SingleChildScrollView parent (GradientContainer),
            // we define a fixed height or just let the Column handle it if the parent scrolls.
            // For now, let's assume the parent handles scrolling or we create a scrollable area.
            SizedBox(
              height: 400, // Or use Expanded() if parent is a Column
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...summaryData.map((data) {
                      return ResultContainer(itemData: data);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}