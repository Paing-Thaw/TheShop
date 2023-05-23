import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  int price;
  int quantity;
  String imgUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imgUrl
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  void addItem(String productId, int price, String title, String imgUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              imgUrl: existingCartItem.imgUrl,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imgUrl: imgUrl,
              quantity: 1));
    }
    notifyListeners();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;

  }
  int get totlQuantity {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity +=  value.quantity;
    });
    return totalQuantity;

  }

  int get itemCount {
    return  _items == null ? 0 : _items.length;
  }

  void removeItem(productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }


}
