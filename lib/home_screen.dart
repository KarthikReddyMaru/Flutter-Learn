import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen(this.questionScreen, {super.key});

  final void Function() questionScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png", width: 250, height: 250),
          SizedBox(
            height: 150,
            child: Center(
              child: Text(
                "Learn flutter the fun way",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: questionScreen,
            label: Text("Start quiz"),
            icon: Icon(Icons.emoji_emotions_outlined)
          ),
        ],
      ),
    );
  }
}
