import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:provider/provider.dart';

import 'card_item.dart';
import 'home_provider.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of(context);
    return SingleChildScrollView(
      child: Column(children: [
        item(provider.productData_1),
        item(provider.productData_2),
        item(provider.productData_3),
      ]),
    );
  }

  item(List list) {
    return Padding(
      padding: AppSize.paddingAll16,
      child: SizedBox(
        height: 275,
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (__, _) => AppSize.sizeWidth10,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (__, index) {
            return CardItem(item: list[index], index: index);
          },
        ),
      ),
    );
  }
}
