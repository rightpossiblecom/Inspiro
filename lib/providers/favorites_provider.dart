import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Quote> _favorites = [];
  static const String _favoritesKey = 'favorite_quotes';

  List<Quote> get favorites => _favorites;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString(_favoritesKey);

    if (favoritesJson != null) {
      final List<dynamic> decodedList = jsonDecode(favoritesJson);
      _favorites = decodedList
          .map((item) => Quote.fromJson(item as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = jsonEncode(
      _favorites.map((quote) => quote.toJson()).toList(),
    );
    await prefs.setString(_favoritesKey, encodedList);
  }

  void toggleFavorite(Quote quote) {
    if (isFavorite(quote)) {
      _favorites.removeWhere(
        (item) => item.text == quote.text && item.author == quote.author,
      );
    } else {
      _favorites.add(quote);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Quote quote) {
    return _favorites.any(
      (item) => item.text == quote.text && item.author == quote.author,
    );
  }

  void removeFavorite(Quote quote) {
    _favorites.removeWhere(
      (item) => item.text == quote.text && item.author == quote.author,
    );
    _saveFavorites();
    notifyListeners();
  }
}
