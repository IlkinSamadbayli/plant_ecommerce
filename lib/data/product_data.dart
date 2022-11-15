import 'package:flutter/cupertino.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/model/product_model.dart';

class ProductData {
  static List<ProductModel> items = [
    ProductModel(
      title: "Chinese Money",
      image: Image.asset(
        GlobalAssets.card_1,
        fit: BoxFit.fill,
      ),
      price: 12,
      rated: '3.8',
      sold: '443',
    ),
    ProductModel(
      title: "Yucca",
      image: Image.asset(
        GlobalAssets.card_2,
        fit: BoxFit.fill,
      ),
      price: 10,
      rated: '4.1',
      sold: '176',
    ),
    ProductModel(
      title: "Monstera",
      image: Image.asset(
        GlobalAssets.card_3,
        fit: BoxFit.fill,
      ),
      price: 9,
      rated: '4.3',
      sold: '51',
    ),
    ProductModel(
      title: "Aloe Vera",
      image: Image.asset(
        GlobalAssets.card_4,
        fit: BoxFit.fill,
      ),
      price: 16,
      rated: '4.1',
      sold: '57',
    ),
    ProductModel(
      title: "Spider Plant",
      image: Image.asset(
        GlobalAssets.card_5,
        fit: BoxFit.fill,
      ),
      price: 11,
      rated: '4.0',
      sold: '147',
    ),
    ProductModel(
      title: "Dumbcane",
      image: Image.asset(
        GlobalAssets.card_6,
        fit: BoxFit.fill,
      ),
      price: 7,
      rated: '3.3',
      sold: '54',
    ),
    ProductModel(
      title: "Orchid",
      image: Image.asset(
        GlobalAssets.card_7,
        fit: BoxFit.fill,
      ),
      price: 14,
      rated: '3.9',
      sold: '412',
    ),
    ProductModel(
      title: "Bromeliad",
      image: Image.asset(
        GlobalAssets.card_8,
        fit: BoxFit.fill,
      ),
      price: 11,
      rated: '3.6',
      sold: '165',
    ),
    ProductModel(
      title: "Lucky Bamboo",
      image: Image.asset(
        GlobalAssets.card_9,
        fit: BoxFit.fill,
      ),
      price: 10,
      rated: '4.1',
      sold: '128',
    ),
  ];
}
