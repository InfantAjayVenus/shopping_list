import 'package:flutter/material.dart';
import 'package:shopping_list/data/groceries_data.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GroceryList(groceries),
      ),
    );
  }
}
