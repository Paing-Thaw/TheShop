// import 'dart:html';

import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:shop/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final productListener = Provider.of<Product>(context);
    final cartListener = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        header: GridTileBar(
          title: Text(''),
          leading: Transform.scale(
            scale: 1.2,
            child: IconButton(
              onPressed: () {
                productListener.toggleFavoriteStatus();
              },
              icon: Icon(productListener.isFavorite? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          trailing: Transform.scale(
            scale: 1.2,
            child: IconButton(
              onPressed: () {
                cartListener.addItem(productListener.id, productListener.price, productListener.title, productListener.imgUrl);
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
             ProductDetailScreen.routeName, arguments: productListener.id,
            );
          },
          child: Image.network(
            productListener.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.8),

          // leading: IconButton(icon: Icon(Icons.favorite), onPressed: () {},),
          title: (Text(
            productListener.title,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          )),
          // trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {},),
          // trailing: Transform.scale(
          //   scale: 0.6,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.shopping_cart),
          //   ),
          // ),
        ),
      ),
    );
  }
}
