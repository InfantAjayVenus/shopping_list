import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Category {
  Category(this.name, this.color) : id = uuid.v4();
  final String id;
  final String name;
  final Color color;
}
