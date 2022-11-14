import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';

import 'package:plant_ecommerce/styles/styles/text_style.dart';

import '../../styles/colors/app_colors.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final IconData? sufixButtonIcon;
  // final bool clicked;
  final VoidCallback? onTap;
  const GlobalButton({
    Key? key,
    required this.text,
    this.sufixButtonIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingH32,
      child: RawMaterialButton(
        padding: AppSize.paddingV16,
        shape: RoundedRectangleBorder(
          borderRadius: GlobalBorderStyle.borderRadius18,
        ),
        onPressed: onTap,
        elevation: 0,
        fillColor: AppColor.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: CustomTextStyle.tinyStyleBold
                    .copyWith(color: AppColor.versionColorWhite
                        // AppColor.numberColor,
                        )),
          ],
        ),
      ),
    );
  }
}
