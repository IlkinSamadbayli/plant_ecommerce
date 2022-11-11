import 'package:flutter/material.dart';

import '../../../../constants/sizedbox.dart';
import '../../../../styles/colors/app_colors.dart';
import '../../../../styles/styles/border_style.dart';
import '../../../../styles/styles/text_style.dart';

class VerifyWidget extends StatelessWidget {
  final void Function()? ontap;
  final Image image;
  final bool isMail;
  final bool isSelected;

  const VerifyWidget({
    Key? key,
    required this.ontap,
    required this.image,
    required this.isMail,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSize.padding10x40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: isSelected
              ? BorderSide(width: 2, color: AppColor.mainColor)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: GlobalBorderStyle.borderRadius40,
          ),
        ),
        onPressed: ontap,
        child: ListTile(
          contentPadding: AppSize.padding20x10,
          leading: image,
          title: Column(
            children: [
              Text(
                isMail ? "via Email" : "via SMS",
                style: CustomTextStyle.tinyStyleGray,
              ),
              AppSize.sizeHeight10,
              Text(isMail ? "ilkin.samadbayli@gmail.com" : "+994 70 742 24 21",
                  style: CustomTextStyle.tinyStyleItalic),
            ],
          ),
        ),
      ),
    );
  }
}
