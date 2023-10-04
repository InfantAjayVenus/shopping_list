import 'package:flutter/material.dart';
import 'package:shopping_list/data/groceries_data.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NewItem(),
                ),
              );
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GroceryList(groceries),
      ),
    );
  }
}
