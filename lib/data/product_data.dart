import 'package:flutter/cupertino.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/model/product_model.dart';

class ProductData {
  static List<ProductModel> items = [
    ProductModel(
      image: Image.asset(
        GlobalAssets.card_1,
        fit: BoxFit.fill,
      ),
      price: 12,
      rated: '3.8',
      sold: '443',
    ),
    ProductModel(
      image: Image.asset(
        GlobalAssets.card_2,
        fit: BoxFit.fill,
      ),
      price: 10,
      rated: '4.1',
      sold: '176',
    ),
    ProductModel(
      image: Image.asset(
        GlobalAssets.card_3,
        fit: BoxFit.fill,
      ),
      price: 9,
      rated: '4.3',
      sold: '51',
    ),
  ];
}
