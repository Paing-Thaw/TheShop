import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:shop/providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        header: GridTileBar(
          title: Text(''),
          leading: Transform.scale(
            scale: 1.2,
            child: IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon: Icon(product.isFavorite? Icons.favorite : Icons.favorite_border),
              color: Colors.black,
            ),
          ),
          trailing: Transform.scale(
            scale: 1.2,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
             ProductDetailScreen.routeName, arguments: product.id,
            );
          },
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          // leading: IconButton(icon: Icon(Icons.favorite), onPressed: () {},),
          title: (Text(
            product.title,
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
