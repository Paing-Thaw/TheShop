import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        title: 'Blue Shoe',
        description: 'Some description text for blue shoe',
        price: 250000,
        imgUrl:
            'https://www.jiomart.com/images/product/600x750/rvrgwpjvsp/bruton-trendy-sports-shoes-for-men-blue-product-images-rvrgwpjvsp-0-202209021256.jpg'),
    Product(
        id: '2',
        title: 'Blue Shoe 2',
        description: 'Some description text for blue shoe',
        price: 250000,
        imgUrl:
            'https://www.helikon-tex.com/media/catalog/product/cache/4/image/500x/17f82f742ffe127f42dca9de82fb58b1/s/p/sp-pgm-dc-11.jpg'),
    Product(
        id: '3',
        title: 'Blue Shoe 3',
        description: 'Some description text for blue shoe',
        price: 250000,
        imgUrl:
            'https://media.cnn.com/api/v1/images/stellar/prod/allbirds-sneakers-review-wool-runnerjpg.jpg?q=h_1090,w_1938,x_0,y_0'),
    Product(
        id: '4',
        title: 'Blue Shoe 4',
        description: 'Some description text for blue shoe',
        price: 250000,
        imgUrl:
            'https://www.stoneycreekhunting.co.nz/image/cache/catalog/product_images/corporate/mens/shirts/Mens_Corporate_Shirt_Long_Sleeve_Float_Navy-875x1000.jpg'),
    Product(
        id: '5',
        title: 'Ear Phone',
        description: 'Some description text for blue shoe',
        price: 250000,
        imgUrl:
        'https://cdn.shopify.com/s/files/1/2957/8646/products/1_95e64265-30d1-42c1-9bc9-9693fea3b894.jpg?v=1664823101'),

  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return items.where((productItem) => productItem.isFavorite).toList();

  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
