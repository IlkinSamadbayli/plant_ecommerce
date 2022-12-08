// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  bool isFavorite;
  Image image;
  String title;
  String sold;
  String rated;
  int price;
  ProductModel({
    this.isFavorite = false,
    required this.image,
    required this.title,
    required this.sold,
    required this.rated,
    required this.price,
  });
}
