import 'package:flutter/material.dart';

import '../../styles/colors/app_colors.dart';

Widget globalButton({
  required String text,
  IconData? sufixButtonIcon,
  required bool isIcon,
  required bool clicked,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: RawMaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      onPressed: onTap,
      elevation: 0,
      fillColor: clicked ? AppColor.mainColor : AppColor.textColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: clicked ? AppColor.versionColorWhite : AppColor.mainColor,
            ),
          ),
          isIcon
              ? Icon(
                  sufixButtonIcon,
                  color:
                      clicked ? AppColor.versionColorWhite : AppColor.mainColor,
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}
