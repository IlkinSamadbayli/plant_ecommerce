import 'package:flutter/material.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';

class CustomTextStyle {
  static TextStyle largeBoldStyle = const TextStyle(
    fontSize: 42,
    fontFamily: "Josefin Sans",
    fontWeight: FontWeight.w500,
  );
  static TextStyle standardStyleItalic = const TextStyle(
    fontSize: 32,
    fontFamily: "Josefin Sans",
    fontStyle: FontStyle.italic,
  );
  static TextStyle standardStyle = const TextStyle(
    fontSize: 32,
    fontFamily: "Josefin Sans",
  );
  static TextStyle littleStyle = const TextStyle(
    fontSize: 24,
    fontFamily: "Josefin Sans",
  );

  static TextStyle tinyStyle = const TextStyle(
    fontSize: 18,
    fontFamily: "Josefin Sans",
  );
  static TextStyle tinyStyleItalic = const TextStyle(
    fontSize: 18,
    fontFamily: "Josefin Sans",
    fontStyle: FontStyle.italic,
  );
  static TextStyle tinyStyleGray = TextStyle(
    fontSize: 18,
    fontFamily: "Josefin Sans",
    color: AppColor.hintTextColor,
  );
  static TextStyle tinyStyleBold = const TextStyle(
    fontSize: 18,
    fontFamily: "Josefin Sans",
    fontWeight: FontWeight.bold,
  );
  static TextStyle moreTinyStyle = const TextStyle(
    fontSize: 14,
    fontFamily: "Josefin Sans",
  );
}
