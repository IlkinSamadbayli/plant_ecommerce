// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/data/product_data.dart';
import 'card_item.dart';

// ignore: must_be_immutable
class CardsWidget extends StatelessWidget {
  late dynamic index;
  CardsWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingH15,
      child: SizedBox(
        height: 240,
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (__, _) => AppSize.sizeWidth10,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (__, _) {
            index++;
            return CardItem(
              item: ProductData.items[index],
            );
          },
        ),
      ),
    );
  }
}