import 'package:shopping_list/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Grocery {
  Grocery({required this.name, required this.count, required this.category})
      : id = uuid.v4();

  final String id;
  final String name;
  final int count;
  final Category category;
}
