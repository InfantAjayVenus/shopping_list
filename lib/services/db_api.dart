import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/category.dart';

final siteRoot = dotenv.env['FIREBASE_URL']!;
const containerName = 'groceries';

Future<Map> getGroceries() async {
  final uri = Uri.https(siteRoot, '/$containerName.json');

  final response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to load groceries)');
  }

  return jsonDecode(response.body);
}

Future<String> addGroceryItem(
    {required String name,
    required int count,
    required Category category}) async {
  final uri = Uri.https(siteRoot, '/$containerName.json');

  final response = await http.post(
    uri,
    body: json.encode({
      'name': name,
      'count': count,
      'category': category.name,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to add item');
  }

  return jsonDecode(response.body)["name"];
}

void deleteGroceryItem(id) async {
  final uri = Uri.https(siteRoot, '/$containerName/$id.json');

  final response = await http.delete(uri);

  if (response.statusCode != 200) {
    {
      throw Exception('Failed to delete item');
    }
  }
}
