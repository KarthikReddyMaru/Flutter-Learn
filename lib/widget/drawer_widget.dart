import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "Options",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
