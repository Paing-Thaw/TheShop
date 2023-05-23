import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final OrderItems orderItem;
  OrderItem(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\MMK${orderItem.amount}'),
            subtitle:
                Text(DateFormat('dd MM yyyy hh:mm').format(orderItem.dateTime)),
            trailing: IconButton(icon: Icon(Icons.expand_more), onPressed: () {},),
          )
        ],
      ),
    );
  }
}
