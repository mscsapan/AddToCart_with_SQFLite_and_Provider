import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  int _count = 1;

  int get count => _count;

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
}
