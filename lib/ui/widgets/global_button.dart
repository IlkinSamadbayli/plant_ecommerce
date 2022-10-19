import 'package:flutter/material.dart';

import 'package:plant_ecommerce/styles/styles/text_style.dart';

import '../../styles/colors/app_colors.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final IconData? sufixButtonIcon;
  final bool isIcon;
  final bool clicked;
  final VoidCallback? onTap;
  const GlobalButton({
    Key? key,
    required this.text,
    this.sufixButtonIcon,
    required this.isIcon,
    required this.clicked,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: RawMaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: onTap,
        elevation: 0,
        fillColor: clicked ? AppColor.primaryColor : AppColor.versionColorWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: CustomTextStyle.tinyStyleBold.copyWith(
                  color: clicked
                      ? AppColor.versionColorWhite
                      : AppColor.numberColor,
                )),
            isIcon
                ? Icon(
                    sufixButtonIcon,
                    color: clicked
                        ? AppColor.versionColorWhite
                        : AppColor.primaryColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
