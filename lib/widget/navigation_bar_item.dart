import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/provider/favorites_provider.dart';
import 'package:sample/screen/meals_screen.dart';

class NavigationBarWidget extends ConsumerStatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  ConsumerState<NavigationBarWidget> createState() {
    return _NavigationBarWidgetState();
  }
}

class _NavigationBarWidgetState extends ConsumerState<NavigationBarWidget> {
  int _selectedIndex = 0;

  void onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(meals: ref.read(favoritesProvider)),
        ),
      );
    }
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
        NavigationDestination(icon: Icon(Icons.star), label: 'Favorites'),
      ],
    );
  }
}
