import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String itemName = '';
  int quantity = 1;
  Category? selectedCategory;

  _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(Grocery(
          name: itemName, count: quantity, category: selectedCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Item Name'),
                ),
                maxLength: 50,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Name must be at least 3 letter long';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    itemName = newValue!;
                  });
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quantity Must not be empty';
                        }

                        if (int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Quantity must be greater than Zero';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          quantity = int.parse(newValue!);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      hint: const Text('Select a Category'),
                      items: [
                        for (final category in availableCategories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.square_rounded,
                                  color: category.value.color,
                                ),
                                Text(category.value.name),
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Add Item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
