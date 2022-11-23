import 'package:flutter/material.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';

class AppThemes {
  static ThemeData get appTheme => ThemeData(
        primaryColor: AppColor.primaryColor,
        primarySwatch: MaterialColor(0xFF645CAA, colorMap),
        scaffoldBackgroundColor: AppColor.versionColorWhite,
        fontFamily: "JosefinSans",
      );
}

InputDecorationTheme get inputDecorationTheme {
  OutlineInputBorder outlineInputBorder =
      OutlineInputBorder(borderRadius: GlobalBorderStyle.borderRadius16);
  return InputDecorationTheme(enabledBorder: outlineInputBorder);
}

Map<int, Color> colorMap = {
  50: AppColor.primaryColor,
  100: AppColor.primaryColor,
  200: AppColor.primaryColor,
  300: AppColor.primaryColor,
  400: AppColor.primaryColor,
  500: AppColor.primaryColor,
  600: AppColor.primaryColor,
  700: AppColor.primaryColor,
  800: AppColor.primaryColor,
  900: AppColor.primaryColor,
};
