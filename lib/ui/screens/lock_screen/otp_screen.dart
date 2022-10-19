import 'package:flutter/material.dart';

import 'package:plant_ecommerce/styles/colors/app_colors.dart';

// ignore: must_be_immutable
class DotsWidget extends StatelessWidget {
  final int dots;
  int count;
  static Color initColor = AppColor.lightGreyColor;
  DotsWidget({
    Key? key,
    required this.dots,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < dots; i++) _fillDots(i)],
    );
  }

  Widget _fillDots(i) {
    if (count > 0) {
      initColor = AppColor.textColor;
      count--;
    } else {
      initColor = AppColor.lightGreyColor;
    }
    return Container(
      width: 35,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
        shape: BoxShape.circle,
        color: initColor,
      ),
    );
  }
}
