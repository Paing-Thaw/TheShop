import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/app_drawer.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';
import 'package:shop/widgets/product_grid.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/providers/cart.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
class ProductOverViewScreen extends StatefulWidget {
  ProductOverViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {

  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final cartListener = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          badges.Badge(

            position: badges.BadgePosition.topEnd(top: 0, end: 2),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Theme.of(context).colorScheme.secondary,
            ),
            badgeContent: Text(
                cartListener.itemCount.toString()),
            child: IconButton(
              padding: EdgeInsets.only(top: 5),
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
              onSelected: (int selectedValue) {
                setState(() {
                  if (selectedValue == 0) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
                if (selectedValue == 0) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(child: Text('Only Favorite'), value: 0),
                    PopupMenuItem(child: Text('Show All'), value: 1),
                  ]),

          //           builder: (_, cartData, ch) => Badge(
          //               child:IconButton(
          // icon: Icon(Icons.shopping_cart), onPressed: () {}),,
          //               value: cartData.itemCount.toString(),
          //               color: Theme.of(context).colorScheme.secondary),
          // child: IconButton(
          // icon: Icon(Icons.shopping_cart), onPressed: () {}),
          //
          //           //     Badge(
          //           //     child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },
          //           //     value: cartData.itemCount.toString(),
          //           //     color: Theme.of(context).colorScheme.secondary,
          //           // ),
          //           //     // child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },
          //           //     ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
