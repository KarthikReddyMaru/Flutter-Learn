import 'package:flutter/material.dart';

class NavigationBarItem extends StatefulWidget {
  const NavigationBarItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarItemState();
  }
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  int _selectedIndex = 0;

  void onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Colors.amber,
      elevation: 5,
      selectedIndex: _selectedIndex,
      onDestinationSelected: onSelectIndex,

      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.set_meal),
          selectedIcon: Icon(Icons.set_meal_outlined),
          label: 'Meals',
        ),
        NavigationDestination(
          icon: Icon(Icons.star),
          label: 'Favorites',
        ),
      ],
    );
  }
}