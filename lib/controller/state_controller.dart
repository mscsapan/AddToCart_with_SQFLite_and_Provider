import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_helper.dart';
import '../model/model.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  int _count = 1;

  int get count => _count;

  Future<List<Product>>? _getProduct;

  Future<List<Product>> get getProduct => _getProduct!;

  final DatabaseHelper? _databaseHelper = DatabaseHelper.databaseHelper;

  Future<List<Product>> getAllQueryProduct() async {
    return _getProduct = _databaseHelper!.getDatabaseProduct();
  }

  void incrementProductItem() {
    _count++;
    notifyListeners();
  }

  void decrementProductItem() {
    if (_count > 1) {
      _count--;
    } else {
      _count;
    }
    notifyListeners();
  }

  int _counter = 0;
  double _totalPrice = 0.0;

  int get counter => _counter;

  double get totalPrice => _totalPrice;

  void _setProductItem() async {
    SharedPreferences item = await SharedPreferences.getInstance();
    item.setInt('counter', _counter);
    item.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getProductItem() async {
    SharedPreferences item = await SharedPreferences.getInstance();
    _counter = item.getInt('counter') ?? 0;

    _totalPrice = item.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  increaseCounter() {
    _counter++;
    _setProductItem();
    notifyListeners();
  }

  decreaseCounter() {
    if (_counter > 1) {
      _counter--;
      _setProductItem();
    }
    notifyListeners();
  }

  int getCounter() {
    _getProductItem();
    return _counter;
  }

  increaseTotalPrice(double newPrice) {
    _totalPrice += newPrice;
    _setProductItem();
    notifyListeners();
  }

  decreaseTotalPrice(double newPrice) {
    _totalPrice -= newPrice;
    _setProductItem();
    notifyListeners();
  }

  double getTotalPrice() {
    _getProductItem();
    return _totalPrice;
  }
}
