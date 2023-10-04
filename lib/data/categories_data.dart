import 'package:flutter/material.dart';
import 'package:shopping_list/enum/category_type.dart';
import 'package:shopping_list/models/category.dart';

Map<CategoryType, Category> availableCategories = {
  CategoryType.vegetables: Category(
    'Vegetables',
    const Color.fromARGB(255, 0, 255, 128),
  ),
  CategoryType.fruit: Category(
    'Fruit',
    const Color.fromARGB(255, 145, 255, 0),
  ),
  CategoryType.meat: Category(
    'Meat',
    const Color.fromARGB(255, 255, 102, 0),
  ),
  CategoryType.dairy: Category(
    'Dairy',
    const Color.fromARGB(255, 175, 222, 233),
  ),
  CategoryType.carbs: Category(
    'Carbs',
    const Color.fromARGB(255, 0, 60, 255),
  ),
  CategoryType.sweets: Category(
    'Sweets',
    const Color.fromARGB(255, 255, 149, 0),
  ),
  CategoryType.spices: Category(
    'Spices',
    const Color.fromARGB(255, 255, 187, 0),
  ),
  CategoryType.convenience: Category(
    'Convenience',
    const Color.fromARGB(255, 191, 0, 255),
  ),
  CategoryType.hygiene: Category(
    'Hygiene',
    const Color.fromARGB(255, 149, 0, 255),
  ),
  CategoryType.other: Category(
    'Other',
    const Color.fromARGB(255, 0, 225, 255),
  ),
};
