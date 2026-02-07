import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/categories_data.dart';

final categoryProvider = Provider((ref) {
  return availableCategories;
});
