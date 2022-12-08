// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/model/product_model.dart';
import 'package:plant_ecommerce/presentation/screens/home/components/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'card_item.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: AppSize.paddingAll16,
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (__, _) => AppSize.sizeWidth10,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, index) {
                ProductModel item = homeProvider.productData_1[index];
                return CardItem(item: item, index: index);
              },
            ),
          ),
        ),
        Padding(
          padding: AppSize.paddingAll16,
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (__, _) => AppSize.sizeWidth10,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, index) {
                ProductModel item = homeProvider.productData_2[index];
                return CardItem(item: item, index: index);
              },
            ),
          ),
        ),
        Padding(
          padding: AppSize.paddingAll16,
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (__, _) => AppSize.sizeWidth10,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, index) {
                ProductModel item = homeProvider.productData_3[index];
                return CardItem(item: item, index: index);
              },
            ),
          ),
        ),
      ]),
    );
  }
}
