import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {

  final Expense expense;
  final void Function(String expenseId) deleteExpense;

  const ExpenseCard({super.key, required this.expense, required this.deleteExpense});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expense.id),
      onDismissed: (direction) {
        print(direction);
        deleteExpense(expense.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(expense.title), Text(expense.category.name)],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(expense.amount.toString()),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
