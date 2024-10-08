import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesProvider with ChangeNotifier {
  List<int> _favoriteIds = [];

  List<int> get favoriteIds => _favoriteIds;

  Database? _db;

  Future<void> initFavorites() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'favorites.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await _db!.query('favorites');
    _favoriteIds = List.generate(maps.length, (i) => maps[i]['id']);

    notifyListeners();
  }

  Future<void> addFavorite(int productId) async {
    if (!_favoriteIds.contains(productId)) {
      _favoriteIds.add(productId);
      await _db!.insert(
        'favorites',
        {'id': productId},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      notifyListeners();
    }
  }

  Future<void> removeFavorite(int productId) async {
    _favoriteIds.remove(productId);
    await _db!.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  Future<void> toggleFavorite(int productId) async {
    if (_favoriteIds.contains(productId)) {
      await removeFavorite(productId);
    } else {
      await addFavorite(productId);
    }
  }

  bool isFavorite(int productId) {
    return _favoriteIds.contains(productId);
  }
}

