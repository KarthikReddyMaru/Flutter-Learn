import 'package:flutter/material.dart';
import 'package:sample/models/expense.dart';
import 'package:sample/widgets/expense_new.dart';
import 'package:sample/widgets/expenses_container.dart';

import '../data/expenses_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> expenses = ExpensesData().expenses;

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void onAddExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) {
        return ExpenseNew(addExpense: addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () => onAddExpense(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ExpensesContainer(expenses: expenses),
    );
  }
}
