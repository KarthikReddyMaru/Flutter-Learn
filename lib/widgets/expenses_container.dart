import 'package:sample/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:sample/widgets/expense_card.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    int totalExpenses = expenses.length;

    return ListView.builder(
      itemCount: totalExpenses,
      itemBuilder: (context, index) {
        return ExpenseCard(expense: expenses[index]);
      },
    );
  }
}
