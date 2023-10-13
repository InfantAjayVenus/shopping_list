import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/services/db_api.dart';
import 'package:shopping_list/widgets/empty_grocery_placeholder.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  List<Grocery> groceries = [];

  @override
  void initState() {
    super.initState();
    getGroceries().then((value) {
      final groceryList = value.entries.map((groceryObject) {
        return Grocery(
          name: groceryObject.value["name"],
          count: groceryObject.value["count"],
          category: availableCategories.entries
              .firstWhere((element) =>
                  element.key.name ==
                  groceryObject.value["category"].toLowerCase())
              .value,
          uid: groceryObject.key,
        );
      }).toList();

      setState(() {
        groceries = groceryList;
      });
    });
  }

  void _onAdd({
    required String name,
    required int count,
    required Category category,
  }) async {
    final id =
        await addGroceryItem(name: name, count: count, category: category);
    final newItem =
        Grocery(name: name, count: count, category: category, uid: id);
    setState(() {
      groceries = [...groceries, newItem];
    });
  }

  void _onDelete(Grocery deletedGrocery) {
    deleteGroceryItem(deletedGrocery.id);
    setState(() {
      groceries = groceries
          .where((grocery) => grocery.id != deletedGrocery.id)
          .toList();
    });
  }

  @override
  build(BuildContext context) {
    Widget content = const EmptyGroceryPlaceholder();

    if (groceries.isNotEmpty) {
      content = GroceryList(groceries, onDeleteItem: _onDelete);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push<Grocery>(
                MaterialPageRoute(
                  builder: (ctx) => NewItem(
                    onSave: _onAdd,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: content,
      ),
    );
  }
}
