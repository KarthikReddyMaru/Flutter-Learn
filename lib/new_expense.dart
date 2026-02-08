import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/models/category.dart';
import 'package:sample/provider/categories_provider.dart';
import 'package:sample/provider/grocery_item_provider.dart';

class NewExpense extends ConsumerStatefulWidget {
  const NewExpense({super.key});

  @override
  ConsumerState<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends ConsumerState<NewExpense> {
  final _formKey = GlobalKey<FormState>();
  late Map<Categories, Category> _categories;

  late String _name, _quantity;
  late Category _category;

  @override
  void initState() {
    super.initState();
    _categories = ref.read(categoriesProvider);
  }

  void onSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref
          .read(groceryItemProvider.notifier)
          .addGroceryItem(_name, int.parse(_quantity), _category);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Name")),
              maxLength: 50,
              validator: titleValidator,
              onSaved: (value) {
                _name = value!;
              },
            ),
            Row(
              children: [
                Expanded(
                  flex: 45,
                  child: TextFormField(
                    decoration: InputDecoration(label: Text("Quantity")),
                    keyboardType: TextInputType.number,
                    validator: quantityValidator,
                    onSaved: (value) {
                      _quantity = value!.toString();
                    },
                  ),
                ),
                Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 50,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    items: _categories.entries
                        .map(
                          (category) => DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ColoredBox(
                                  color: category.value.color,
                                  child: SizedBox(width: 14, height: 14),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    category.value.name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      _category = value!;
                    },
                    initialValue: _categories[Categories.hygiene],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                ),
                SizedBox(width: 15),
                ElevatedButton(onPressed: onSave, child: Text("Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? titleValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return "Title should be of length 1 to 50";
    }
    return null;
  }

  String? quantityValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        int.tryParse(value) == null ||
        int.tryParse(value)! < 0) {
      return "Quantity should be 1 to 50";
    }
    return null;
  }
}
