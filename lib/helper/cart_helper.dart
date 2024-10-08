import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../providers/product_provider.dart';

class CartProvider with ChangeNotifier {
  List<int> _cartProductIds = [];
  final Map<int, int> _productCounters = {};

  List<int> get cartProductIds => _cartProductIds;
  int getProductCounter(int productId) => _productCounters[productId] ?? 1;

  Database? _db;
  double getProductPrice(int productId, ProductProvider productProvider) {
    final product = productProvider.products.firstWhere(
      (prod) => prod.id == productId,
      // orElse: () => ProductModel(id: productId, price: 0.0, title: ''), // Default value
    );
    return product.price;
  }

  double totalPrice(BuildContext context) {
    double total = 0.0;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    for (int productId in _cartProductIds) {
      int quantity = _productCounters[productId] ?? 0;
      double price = getProductPrice(productId, productProvider);
      total += price * quantity;
    }
    return total;
  }

  Future<void> initCart() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY, counter INTEGER)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await _db!.query('cart');
    _cartProductIds = List.generate(maps.length, (i) => maps[i]['id']);
    for (var map in maps) {
      _productCounters[map['id']] = map['counter'];
    }

    notifyListeners();
  }

  Future<void> addToCart(int productId) async {
    if (!_cartProductIds.contains(productId)) {
      _cartProductIds.add(productId);
      _productCounters[productId] = 1;
      await _db!.insert(
        'cart',
        {'id': productId, 'counter': 1},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      notifyListeners();
    }
  }

  Future<void> removeFromCart(int productId) async {
    _cartProductIds.remove(productId);
    _productCounters.remove(productId);
    await _db!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  Future<void> updateCounter(int productId, int newCounter) async {
    _productCounters[productId] = newCounter;
    await _db!.update(
      'cart',
      {'counter': newCounter},
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  void inc(int productId) {
    int currentCount = _productCounters[productId] ?? 1;
    updateCounter(productId, currentCount + 1);
    notifyListeners();
  }

  void dec(int productId) {
    int currentCount = _productCounters[productId] ?? 1;

    if (currentCount > 1) {
      updateCounter(productId, currentCount - 1);
      notifyListeners();
    }
  }

  Future<void> removeItem(int productId) async {
    await removeFromCart(productId);
    notifyListeners();
  }

  int get totalItemCount {
    return _productCounters.values.fold(0, (sum, count) => sum + count);
  }
}
