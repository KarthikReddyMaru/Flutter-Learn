import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/dummy_data.dart';
import 'package:sample/models/grocery_item.dart';

import '../models/category.dart';

class GroceryItemProvider extends Notifier<List<GroceryItem>> {
  @override
  List<GroceryItem> build() {
    return groceryItems;
  }

  void addGroceryItem(String name, int quantity, Category category) {
    state = [
      ...state,
      GroceryItem(
        id: DateTime.now().toString(),
        name: name,
        quantity: quantity,
        category: category,
      ),
    ];
  }
}

final groceryItemProvider =
    NotifierProvider<GroceryItemProvider, List<GroceryItem>>(
      GroceryItemProvider.new,
    );
