import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double getTotalPrice() {
    return _items.fold(0, (total, item) => total + item.price);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
