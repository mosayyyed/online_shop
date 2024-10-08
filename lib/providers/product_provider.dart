import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../helper/product_api_helper.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  String? errorMessage;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await ProductApiHelper(Dio()).fetchProducts();
      products = (result.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsByCategory(String category) async {
    isLoading = true;
    notifyListeners();
    try {
      final result =
          await ProductApiHelper(Dio()).fetchProductsByCategory(category);
      productsByCategory = (result.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<ProductModel> getFavoriteProducts(List<int> favoriteIds) {
    return products
        .where((product) => favoriteIds.contains(product.id))
        .toList();
  }

  List<ProductModel> getCartProducts(List<int> cartIds) {
    return products.where((product) => cartIds.contains(product.id)).toList();
  }
}
