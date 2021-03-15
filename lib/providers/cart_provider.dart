import 'package:flutter/material.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/product.dart';

class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart(products: []);

  Cart get cart => _cart;

  int get totalProducts => _cart.products.length;

  void addProduct(Product product) {
    print('add product');
    _cart.products.add(product);
    notifyListeners();
  }

  bool hasProducts() {
    return _cart.products.length > 0;
  }

  void removeAll() {
    _cart.products.clear();
    notifyListeners();
  }
}
