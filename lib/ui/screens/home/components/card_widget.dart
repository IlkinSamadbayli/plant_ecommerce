import 'package:flutter/material.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

class CardWidget extends StatelessWidget {
  // final List<String> images = [
  //   GlobalAssets.card_1,
  //   GlobalAssets.card_2,
  //   GlobalAssets.card_3,
  // ];
  final Image image;
  final String text;
  final String rated;
  final String price;
  const CardWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.rated,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var name = names.map((name) => name).toList();
    // var image = images.map((e) => e).toString();
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
                  child: image,
                ),
                AppSize.sizeHeight8,
                Text(
                  "Rubber fig Plant",
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
                      rated,
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
                        "266 sold",
                        style: CustomTextStyle.moreTinyStyleGreen,
                      ),
                    )
                  ],
                ),
                AppSize.sizeHeight4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " \$$price",
                      style: CustomTextStyle.littleStyleGreen,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 16,
          top: 16,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
