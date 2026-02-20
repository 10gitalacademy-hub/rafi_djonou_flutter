import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  String _language = 'fr';
  List<Map<String, dynamic>> _cart = [];
  List<int> _favorites = [];
  bool _isLoggedIn = false;

  String get language => _language;
  List<Map<String, dynamic>> get cart => _cart;
  List<int> get favorites => _favorites;
  bool get isLoggedIn => _isLoggedIn;

  AppState() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'fr';
    notifyListeners();
  }

  Future<void> setLanguage(String lang) async {
    _language = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    notifyListeners();
  }

  void addToCart(Map<String, dynamic> product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void toggleFavorite(int productId) {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
    } else {
      _favorites.add(productId);
    }
    notifyListeners();
  }

  bool isFavorite(int productId) => _favorites.contains(productId);

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  double get cartTotal {
    return _cart.fold(0.0, (sum, item) => sum + ((item['price'] as num?) ?? 0).toDouble());
  }
}
