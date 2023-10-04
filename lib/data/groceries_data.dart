import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/enum/category_type.dart';
import 'package:shopping_list/models/grocery.dart';

final List<Grocery> groceries = [
  Grocery(
    name: 'Milk',
    count: 2,
    category: availableCategories[CategoryType.dairy]!,
  ),
  Grocery(
    name: 'Bread',
    count: 1,
    category: availableCategories[CategoryType.carbs]!,
  ),
  Grocery(
    name: 'Eggs',
    count: 3,
    category: availableCategories[CategoryType.other]!,
  ),
  Grocery(
    name: 'Cheese',
    count: 1,
    category: availableCategories[CategoryType.dairy]!,
  )
];
