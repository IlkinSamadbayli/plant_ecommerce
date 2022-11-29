
import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:provider/provider.dart';

import '../provider/lock_screen_provider.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Padding(
        padding: AppSize.padding32x32x15,
        child: Consumer<LockProvider>(
          builder: (context, value, child) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              int number = index + 1;
              String stringNumber = number.toString();
              if (number == 11) stringNumber = "0";
              if (number == 10) stringNumber = "*";
              if (number == 12) {
                return TextButton(
                  style: TextButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {
                    if (value.currentPin.isNotEmpty) {
                      // print('backspace');
                      value.setPin(number, true);
                    }
                  },
                  child: Icon(
                    Icons.backspace,
                    size: 30,
                    color: AppColor.hintTextColor,
                  ),
                );
              } else {
                return TextButton(
                  style: TextButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {
                    if (stringNumber == "*") {
                      value.clearPin;
                    } else {
                      value.setPin(number, false);
                    }
                  },
                  child: Center(
                    child: Text(
                      stringNumber,
                      style: CustomTextStyle.standardStyle,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}