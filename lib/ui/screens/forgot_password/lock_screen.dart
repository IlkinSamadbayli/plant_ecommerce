import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/screens/home/home_screen.dart';
import 'package:plant_ecommerce/ui/global_widgets/global_button.dart';

import '../../../constants/routes/global_routes.dart';
import '../../../styles/colors/app_colors.dart';
import 'widgets/otp_screen.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => LockScreenState();
}

class LockScreenState extends State<LockScreen> {
  static int numberOfDots = 4;
  late String currentPin = '';
  late int inputPinCount = 0;

  void setPin(int n, bool unset) {
    inputPinCount = currentPin.length;
    if (unset) {
      inputPinCount--;
      currentPin = currentPin.substring(0, inputPinCount);
    } else {
      if (inputPinCount < numberOfDots) {
        currentPin += n.toString();
        inputPinCount++;
      }
    }
    setState(() {});
  }

  void get clearPin {
    setState(() {});

    inputPinCount = 0;
    currentPin = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSize.padding20x10,
              child: Row(
                children: [
                  IconButton(
                    highlightColor: AppColor.highlightColor,
                    onPressed: () {
                      GlobalRoutes.back(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  AppSize.sizeWidth10,
                  Text(
                    'Create New PIN',
                    style: CustomTextStyle.littleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppSize.paddingAll16,
              child: Text(
                "Add a PIN number to make your account more secure.",
                style: CustomTextStyle.tinyStyleItalic,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: AppSize.padding50x80,
              child: DotsWidget(count: inputPinCount, dots: numberOfDots),
            ),
            AppSize.sizeHeight130,
            GlobalButton(
              text: "Continue",
              onTap: () {
                setState(() {});
                if (currentPin == '1234') {
                  Get.to(() => const HomeScreen());
                } else {
                  context.snackbarErrorMessage;
                }
              },
            ),
            numberpad,
          ],
        ),
      ),
    );
  }

  Widget get numberpad {
    return Expanded(
      child: Padding(
        padding: AppSize.padding32x32x10,
        child: GridView.builder(
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
                  if (currentPin.isNotEmpty) {
                    // print('backspace');
                    setPin(number, true);
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
                    clearPin;
                  } else {
                    setPin(number, false);
                  }
                  // print("inputPincount: $inputPinCount");
                  // print("currentPin: $currentPin");
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
    );
  }
}
