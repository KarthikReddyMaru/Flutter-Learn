import 'package:sample/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:sample/widgets/expense_card.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer({super.key, required this.expenses, required this.deleteExpense});

  final List<Expense> expenses;
  final void Function(String expenseId) deleteExpense;

  @override
  Widget build(BuildContext context) {
    int totalExpenses = expenses.length;

    return ListView.builder(
      itemCount: totalExpenses,
      itemBuilder: (context, index) {
        return ExpenseCard(expense: expenses[index], deleteExpense: deleteExpense);
      },
    );
  }
}
