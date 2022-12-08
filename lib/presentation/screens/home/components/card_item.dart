// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/model/product_model.dart';
import 'package:plant_ecommerce/presentation/screens/home/components/provider/home_provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

class CardItem extends StatelessWidget {
  final ProductModel item;
  final int index;
  const CardItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 6,
          semanticContainer: true,
          shadowColor: AppColor.highlightColor,
          color: AppColor.waterColor,
          shape: RoundedRectangleBorder(
              borderRadius: GlobalBorderStyle.borderRadius10),
          child: Container(
            padding: AppSize.paddingAll4,
            width: 162,
            child: Column(
              children: [
                Padding(
                  padding: AppSize.paddingAll5,
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: item.image,
                  ),
                ),
                AppSize.sizeHeight8,
                Text(
                  item.title,
                  style: CustomTextStyle.tinyStyleBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppSize.sizeWidth6,
                    Icon(
                      Icons.star,
                      color: AppColor.mainColor,
                    ),
                    AppSize.sizeWidth4,
                    Text(
                      item.rated,
                      style: CustomTextStyle.tinyStyleGray,
                    ),
                    AppSize.sizeWidth8,
                    const Text("|"),
                    AppSize.sizeWidth8,
                    Container(
                      padding: AppSize.paddingAll4,
                      decoration: BoxDecoration(
                        borderRadius: GlobalBorderStyle.borderRadius10,
                        border: Border.all(width: 1, color: AppColor.mainColor),
                      ),
                      child: Text(
                        "${item.sold} sold",
                        style: CustomTextStyle.moreTinyStyleGreen,
                      ),
                    )
                  ],
                ),
                AppSize.sizeHeight4,
                Text(
                  "Amount %20",
                  style: CustomTextStyle.littleStyle,
                ),
                AppSize.sizeHeight4,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSize.sizeWidth10,
                    Text(
                      " \$${item.price}",
                      style: CustomTextStyle.littleStylelineThroughItalic,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      " \$${(item.price * 0.8).toStringAsFixed(1)}",
                      style: CustomTextStyle.littleStyleGreenItalic,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Consumer<HomeProvider>(
            builder: (context, value, child) => IconButton(
              onPressed: () {
                value.addFavor(item);
              },
              icon: Icon(
                Icons.favorite,
                color:
                    item.isFavorite ? AppColor.errorColor : AppColor.waterColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
