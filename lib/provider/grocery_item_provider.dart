import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/dummy_data.dart';
import 'package:sample/models/grocery_item.dart';

class GroceryItemProvider extends Notifier<List<GroceryItem>> {
  @override
  List<GroceryItem> build() {
    return groceryItems;
  }
}

final groceryItemProvider =
    NotifierProvider<GroceryItemProvider, List<GroceryItem>>(
      GroceryItemProvider.new,
    );
