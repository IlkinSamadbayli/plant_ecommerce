// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/model/product_model.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

// ignore: must_be_immutable
class CardWidget extends StatefulWidget {
  ProductModel item;
  final List<String> favoriteCard;
  CardWidget({
    Key? key,
    required this.item,
    required this.favoriteCard,
  }) : super(key: key);
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isFavorite = false;
  String likedCard = "Liked Card";
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
                  child: Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: widget.item.image,
                    ),
                  ),
                ),
                AppSize.sizeHeight8,
                Text(
                  widget.item.title,
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
                      widget.item.rated,
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
                        "${widget.item.sold} sold",
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
                      " \$${widget.item.price}",
                      style: CustomTextStyle.littleStylelineThroughItalic,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      " \$${(widget.item.price * 0.8).toStringAsFixed(1)}",
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
          child: IconButton(
            onPressed: () => setState(() {
              isFavorite = !isFavorite;
              // widget.favoriteCard.add(likedCard).toList();
              // print("sd");
            }),
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? AppColor.errorColor : AppColor.waterColor,
            ),
          ),
        ),
      ],
    );
  }
}
