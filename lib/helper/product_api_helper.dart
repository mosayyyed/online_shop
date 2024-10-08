import 'package:dio/dio.dart';

class ProductApiHelper {
  final Dio dio;

  ProductApiHelper(this.dio);
  final baseUrl = 'https://fakestoreapi.com/products';

  Future<Response> fetchProducts() async {
    final response = await dio.get(
      baseUrl,
    );
    return response;
  }

  Future<Response> fetchProductsByCategory(String category) {
    return dio.get('https://fakestoreapi.com/products/category/$category');
  }
}
