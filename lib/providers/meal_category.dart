import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/category.dart';
import 'package:http/http.dart' as http;

class MealCategory extends ChangeNotifier {
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  List<Category> _categories = [];

  List<Category> get categories {
    return [..._categories];
  }

  Future<void> fetchAllCategories() async {
    final uri = Uri.parse(baseUrl + 'categories.php');

    final resp = await http.get(uri);
    print(resp.body);
  }
}
