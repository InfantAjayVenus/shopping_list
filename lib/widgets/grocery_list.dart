import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';

class GroceryList extends StatelessWidget {
  const GroceryList(this.groceries, {super.key});
  final List<Grocery> groceries;

  @override
  build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (ctx, index) {
        return Row(
          children: [
            Icon(
              Icons.square_rounded,
              color: groceries[index].category.color,
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(child: Text(groceries[index].name)),
            Text(groceries[index].count.toString()),
          ],
        );
      },
    );
  }
}
