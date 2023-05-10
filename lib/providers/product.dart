import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final int price;
  final String imgUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imgUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

