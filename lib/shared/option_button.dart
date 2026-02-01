import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key, required this.onPick, required this.widget});

  final void Function() onPick;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        // Reason why we see gaps in between button
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
      ),
      onPressed: onPick,
      child: widget,
    );
  }
}
