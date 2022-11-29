import 'package:flutter/material.dart';

class AppSize {
  static double deviceHeight(context) => MediaQuery.of(context).size.height;
  static double deviceWidth(context) => MediaQuery.of(context).size.width;

  static SizedBox get sizeHeight4 => const SizedBox(height: 4);
  static SizedBox get sizeHeight8 => const SizedBox(height: 8);
  static SizedBox get sizeHeight10 => const SizedBox(height: 10);
  static SizedBox get sizeHeight16 => const SizedBox(height: 16);
  static SizedBox get sizeHeight20 => const SizedBox(height: 20);
  static SizedBox get sizeHeight24 => const SizedBox(height: 24);
  static SizedBox get sizeHeight30 => const SizedBox(height: 30);
  static SizedBox get sizeHeight32 => const SizedBox(height: 32);
  static SizedBox get sizeHeight40 => const SizedBox(height: 40);
  static SizedBox get sizeHeight50 => const SizedBox(height: 50);
  static SizedBox get sizeHeight60 => const SizedBox(height: 60);
  static SizedBox get sizeHeight80 => const SizedBox(height: 80);
  static SizedBox get sizeHeight100 => const SizedBox(height: 100);
  static SizedBox get sizeWidth4 => const SizedBox(width: 4);
  static SizedBox get sizeWidth6 => const SizedBox(width: 6);
  static SizedBox get sizeWidth8 => const SizedBox(width: 8);
  static SizedBox get sizeWidth10 => const SizedBox(width: 10);
  static SizedBox get sizeWidth16 => const SizedBox(width: 16);
  static SizedBox get sizeWidth20 => const SizedBox(width: 20);
  static SizedBox get sizeWidth40 => const SizedBox(width: 40);

  static EdgeInsetsGeometry get paddingV4 =>
      const EdgeInsets.symmetric(vertical: 4);

  static EdgeInsetsGeometry get paddingH8 =>
      const EdgeInsets.symmetric(horizontal: 8);

  static EdgeInsetsGeometry get paddingV10 =>
      const EdgeInsets.symmetric(vertical: 10);

  static EdgeInsetsGeometry get paddingH15 =>
      const EdgeInsets.symmetric(horizontal: 15);

  static EdgeInsetsGeometry get paddingV16 =>
      const EdgeInsets.symmetric(vertical: 16);

  static EdgeInsetsGeometry get paddingH20 =>
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsetsGeometry get paddingH35 =>
      const EdgeInsets.symmetric(horizontal: 35);

  static EdgeInsetsGeometry get padding32x32x15 =>
      const EdgeInsets.only(right: 32, left: 32, top: 15);

  static EdgeInsetsGeometry get padding24x24x40 =>
      const EdgeInsets.only(right: 24, left: 24, top: 40);

  static EdgeInsetsGeometry get padding8x6x6 =>
      const EdgeInsets.only(left: 8, top: 6, bottom: 6);

  static EdgeInsetsGeometry get paddingRight12 =>
      const EdgeInsets.only(right: 12);

  static EdgeInsetsGeometry get paddingH25 =>
      const EdgeInsets.symmetric(horizontal: 25);

  static EdgeInsetsGeometry get paddingH32 =>
      const EdgeInsets.symmetric(horizontal: 32);

  static EdgeInsetsGeometry get paddingH40 =>
      const EdgeInsets.symmetric(horizontal: 40);

  static EdgeInsetsGeometry get paddingH80 =>
      const EdgeInsets.symmetric(horizontal: 80);

  static EdgeInsetsGeometry get paddingTop100 =>
      const EdgeInsets.only(top: 100);

  static EdgeInsetsGeometry get paddingH110 =>
      const EdgeInsets.symmetric(horizontal: 110);

  static EdgeInsetsGeometry get padding20x10 =>
      const EdgeInsets.symmetric(vertical: 20, horizontal: 10);

  static EdgeInsetsGeometry get padding30x30 =>
      const EdgeInsets.symmetric(vertical: 30, horizontal: 30);

  static EdgeInsetsGeometry get padding8x32 =>
      const EdgeInsets.symmetric(vertical: 8, horizontal: 32);

  static EdgeInsetsGeometry get padding10x40 =>
      const EdgeInsets.symmetric(vertical: 10, horizontal: 40);

  static EdgeInsetsGeometry get padding60x60 =>
      const EdgeInsets.symmetric(vertical: 60, horizontal: 60);

  static EdgeInsetsGeometry get padding50x80 =>
      const EdgeInsets.symmetric(vertical: 50, horizontal: 80);

  static EdgeInsetsGeometry get padding20x120 =>
      const EdgeInsets.symmetric(vertical: 20, horizontal: 120);


  static EdgeInsetsGeometry get paddingAll40 => const EdgeInsets.all(40);
  static EdgeInsetsGeometry get paddingAll24 => const EdgeInsets.all(24);
  static EdgeInsetsGeometry get paddingAll16 => const EdgeInsets.all(16);
  static EdgeInsetsGeometry get paddingAll5 => const EdgeInsets.all(5);
  static EdgeInsetsGeometry get paddingAll4 => const EdgeInsets.all(4);
  static EdgeInsetsGeometry get paddingAll3 => const EdgeInsets.all(3);
}
