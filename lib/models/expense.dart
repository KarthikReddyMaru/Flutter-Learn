import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final dateFormatter = DateFormat.yMMMd();

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime dateTime;

  @override
  String toString() {
    return 'Expense{id: $id, title: $title, amount: $amount, category: $category, dateTime: $dateTime}';
  }

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.dateTime,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(dateTime);
  }
}

enum Category { food, travel }
