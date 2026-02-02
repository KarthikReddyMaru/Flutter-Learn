import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Optional: for better fonts

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrect = itemData['user_answer'] == itemData['correct_answer'];

    // Conditional Coloring
    final Color statusColor = isCorrect ? Colors.tealAccent : Colors.pinkAccent;

    return Padding( // Add breathing room between items
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to top
        children: [
          // 1. The Question Number Bubble
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: statusColor, // Dynamic color
              shape: BoxShape.circle,
            ),
            child: Text(
              ((itemData['question_index'] as int) + 1).toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Contrast against the bubble
              ),
            ),
          ),
          const SizedBox(width: 20), // Spacing between bubble and text

          // 2. The Question and Answers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  itemData['user_answer'] as String,
                  style: TextStyle(
                    color: Colors.purple.shade100, // Differentiate user answer
                  ),
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Colors.tealAccent, // Highlight correct answer
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}