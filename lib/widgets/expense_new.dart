import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/models/expense.dart';

class ExpenseNew extends StatefulWidget {
  const ExpenseNew({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<StatefulWidget> createState() {
    return _ExpenseNewState();
  }
}

class _ExpenseNewState extends State<ExpenseNew> {
  var title = TextEditingController(text: "Sample");
  var amount = TextEditingController(text: "20");
  Category category = Category.food;
  DateTime? selectedDate;
  var formattedDate = "";

  @override
  void dispose() {
    title.dispose();
    amount.dispose();
    super.dispose();
  }

  void onPressCalender(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        formattedDate = DateFormat.yMMMd().format(selectedDate!);
      });
    }
  }

  void onSaveExpense() {
    final expense = Expense(
      title: title.text,
      amount: double.tryParse(amount.text)!,
      category: category,
      dateTime: selectedDate!,
    );
    widget.addExpense(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 60,
                child: TextField(
                  decoration: InputDecoration(label: Text("Title")),
                  keyboardType: TextInputType.text,
                  controller: title,
                ),
              ),
              Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 35,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                  keyboardType: TextInputType.number,
                  controller: amount,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 40,
                child: DropdownMenu(
                  initialSelection: Category.food,
                  dropdownMenuEntries: Category.values.map((e) {
                    return DropdownMenuEntry(
                      value: e,
                      label: e.name.toUpperCase(),
                    );
                  }).toList(),
                  textAlign: TextAlign.center,
                  onSelected: (value) {
                    if (value != null) category = value;
                  },
                ),
              ),
              Expanded(
                flex: 20,
                child: IconButton(
                  onPressed: () => onPressCalender(context),
                  icon: Icon(Icons.calendar_month_outlined),
                ),
              ),
              Expanded(flex: 40, child: Text(formattedDate)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 10),
              ElevatedButton(onPressed: onSaveExpense, child: Text("Save")),
            ],
          ),
        ],
      ),
    );
  }
}
