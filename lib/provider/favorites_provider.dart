import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/models/meal.dart';

class FavoritesProvider extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

  bool toggleMeal(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    state = [...state, meal];
    return true;
  }
}

final favoritesProvider = NotifierProvider<FavoritesProvider, List<Meal>>(
  FavoritesProvider.new,
);
