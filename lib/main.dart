import 'package:flutter/material.dart';
import 'package:shopping_list/screens/App.dart';

void main() {
  runApp(const ShoppingListApp());
}

final theme = ThemeData(
  brightness: Brightness.dark,
);

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.orange.shade300,
          surface: const Color.fromARGB(255, 41, 38, 35),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 27, 20, 8),
      ),
      title: 'Shopping List',
      home: const App(),
    );
  }
}
