import 'package:flutter/material.dart';
import 'package:shopping_list/data/groceries_data.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/screens/new_item.dart';
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
    groceries = groceriesList;
  }

  void _onDelete(Grocery deletedGrocery) {
    setState(() {
      groceries = groceries
          .where((grocery) => grocery.id != deletedGrocery.id)
          .toList();
    });
  }

  @override
  build(BuildContext context) {
    print('DEBUG:GROCERY_LIST: $groceries');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () async {
              final groceryItem = await Navigator.of(context).push<Grocery>(
                MaterialPageRoute(
                  builder: (ctx) => const NewItem(),
                ),
              );

              if (groceryItem == null) {
                return;
              }
              setState(() {
                groceries = [...groceries, groceryItem];
              });
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GroceryList(groceries, onDeleteItem: _onDelete),
      ),
    );
  }
}
