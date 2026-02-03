import 'package:sample/models/expense.dart';

class ExpensesData {
  final List<Expense> expenses = [
    Expense(
      title: "Sushi",
      amount: 40,
      category: Category.food,
      dateTime: DateTime.now(),
    ),
    Expense(
      title: "Water",
      amount: 10,
      category: Category.food,
      dateTime: DateTime.now(),
    ),
  ];
}
