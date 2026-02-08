import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/models/grocery_item.dart';
import 'package:sample/new_expense.dart';
import 'package:sample/provider/grocery_item_provider.dart';

class ShoppingItemsScreen extends ConsumerWidget {
  const ShoppingItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GroceryItem> items = ref.watch(groceryItemProvider).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => NewExpense())),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: ColoredBox(
              color: items[index].category.color,
              child: SizedBox(width: 20, height: 20),
            ),
            title: Text(items[index].name),
            trailing: Text(items[index].quantity.toString()),
          );
        },
      ),
    );
  }
}
