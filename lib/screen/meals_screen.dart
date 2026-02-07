import 'package:flutter/material.dart';
import 'package:sample/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(15),
            elevation: 7,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                FadeInImage(
                  placeholder: AssetImage("assets/Loading_icon.gif"),
                  image: NetworkImage(meals[index].imageUrl),
                  fadeInDuration: Duration(milliseconds: 300),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      meals[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
