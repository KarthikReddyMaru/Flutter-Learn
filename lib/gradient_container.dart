import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  const GradientContainer({super.key, required this.widget, required this.colors});
  const GradientContainer.purple({super.key, required this.widget}): colors = const [Colors.deepPurple, Colors.deepPurpleAccent];

  final Widget widget;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      child: widget,
    );
  }

}