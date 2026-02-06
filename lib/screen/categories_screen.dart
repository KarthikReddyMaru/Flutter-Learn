import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals"),),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 30,
          // childAspectRatio: 3 /2
        ),
        children: [
          for (int i = 0; i < 8; i++)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              child: Text("data", textAlign: TextAlign.center),
            ),
        ],
      ),
    );
  }
}
