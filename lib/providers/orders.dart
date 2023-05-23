import 'package:flutter/foundation.dart';
import 'cart.dart';

class OrderItems {
  final String id;
  final int amount;
  final List<CartItem> orderedProducts;
  final DateTime dateTime;

  OrderItems({
    required this.id,
    required this.amount,
    required this.orderedProducts,
    required this.dateTime,
  });
}

class Orders   with ChangeNotifier {
  List<OrderItems> _orders = [];

  List<OrderItems> get orders {
    return[..._orders];
  }

  void addOrder(List<CartItem> cartProducts, int total) {
    _orders.insert(
      0,
      OrderItems(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        orderedProducts: cartProducts
      ),
    );
    notifyListeners();
  }


}
