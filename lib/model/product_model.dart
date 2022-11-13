import 'package:flutter/material.dart';

class ProductModel {
  Image image;
  String sold;
  String rated;
  int price;
  ProductModel({
    required this.image,
    required this.sold,
    required this.rated,
    required this.price,
  });
}
