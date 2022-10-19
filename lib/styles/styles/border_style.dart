import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class GlobalBorderStyle {
  static BorderRadius get borderRadius10 => BorderRadius.circular(10);
  static BorderRadius get borderRadius12 => BorderRadius.circular(12);
  static BorderRadius get borderRadius16 => BorderRadius.circular(16);
  static BorderRadius get borderRadius40 => BorderRadius.circular(40);
  static InputBorder get borderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: BorderSide(
          color: AppColor.focusColor,
        ),
      );

  static InputBorder focusBorderStyle(bool isCorrect) => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: BorderSide(
          color: isCorrect ? AppColor.mainColor : AppColor.errorColor,
        ),
      );
  static InputBorder get errorBorderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: BorderSide(
          color: AppColor.errorColor,
        ),
      );
  static InputBorder get enabledBorderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: BorderSide(
          color: AppColor.primaryColor,
        ),
      );
}
