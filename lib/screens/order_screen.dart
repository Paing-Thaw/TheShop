import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/order_item.dart';
import 'package:shop/widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/wewe';
  @override
  Widget build(BuildContext context) {
    final orderListener = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(orderListener.orders[index]),
        itemCount: orderListener.orders.length,
      ),
    );
  }
}
