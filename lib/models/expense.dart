
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime dateTime;

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.dateTime,
  }) : id = uuid.v4();
}

enum Category { food, travel }
