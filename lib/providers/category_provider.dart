import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      final response =
          await Dio().get('https://fakestoreapi.com/products/categories');
      List<String> categoryNames = List<String>.from(response.data);

      Map<String, String> categoryImages = {
        "electronics": "assets/category_images/mobile-phone.png",
        "jewelery": "assets/category_images/shopping-bags.png",
        "men's clothing": "assets/category_images/office-worker.png",
        "women's clothing": "assets/category_images/woman-office.png",
      };

      _categories = categoryNames.map((name) {
        return Category(
          name: name,
          imagePath:
              categoryImages[name] ?? 'assets/category_images/mobile-phone.png',
        );
      }).toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
}
