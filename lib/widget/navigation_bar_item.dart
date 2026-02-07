import 'package:flutter/material.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarWidgetState();
  }
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
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