import 'package:flutter/foundation.dart';

class CoffeeOrderNotifier extends ChangeNotifier {
  int _quantity = 1;
  final int _price = 10;
  void addQuantity(int quan) {
    if (quan >= 0) {
      _quantity += quan;
      if (_quantity > 10) {
        _quantity = 10;
      }
      notifyListeners();
    }
  }

  void removeQuantity(int quan) {
    if (quan >= 0) {
      _quantity -= quan;
      if (_quantity < 0) {
        _quantity = 0;
      }
      notifyListeners();
    }
  }

  int get totalPrice => _price * _quantity;
  int get quantity => _quantity;
}
