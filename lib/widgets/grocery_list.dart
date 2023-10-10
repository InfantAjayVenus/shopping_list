import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';

class GroceryList extends StatelessWidget {
  const GroceryList(this.groceries, {super.key, required this.onDeleteItem});
  final List<Grocery> groceries;
  final void Function(Grocery) onDeleteItem;

  @override
  build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(groceries[index].id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              onDeleteItem(groceries[index]);
            }
          },
          background: Container(
            color: const Color.fromARGB(255, 119, 36, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete,
                )
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
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
            ),
          ),
        );
      },
    );
  }
}
