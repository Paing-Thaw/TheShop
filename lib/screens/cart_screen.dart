import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/cart_item.dart' as cart;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartListner = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Product : ', //style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${cartListner.totlQuantity}',
                      ),
                      Spacer(),
                      Chip(
                        label: Text('\MMK ${cartListner.totalAmount}'),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Order Now'))
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartListner.itemCount,
                itemBuilder: (context, index) => cart.CartItem(
                      cartListner.item.values.toList()[index].id,
                      cartListner.item.keys.toList()[index],
                      cartListner.item.values.toList()[index].price,
                      cartListner.item.values.toList()[index].quantity,
                      cartListner.item.values.toList()[index].title,
                      cartListner.item.values.toList()[index].imgUrl,
                    )),
          ),
        ],
      ),
    );
  }
}
