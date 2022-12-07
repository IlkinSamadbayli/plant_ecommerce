import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/provider/lock_screen_provider.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/widgets/numberpad.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/presentation/screens/home/home_screen.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_button.dart';
import 'package:provider/provider.dart';

import '../../../constants/routes/global_routes.dart';
import '../../../styles/colors/app_colors.dart';
import 'widgets/otp_screen.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LockProvider>(
          builder: (context, value, child) => Column(
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
                child: DotsWidget(
                    count: value.inputPinCount, dots: value.numberOfDots),
              ),
              AppSize.sizeHeight80,
              GlobalButton(
                text: "Continue",
                onTap: () {
                  if (value.currentPin == '1234') {
                    Get.off(() => const HomeScreen());
                  } else {
                    context.snackbarErrorMessage;
                  }
                },
              ),
              const NumberPad(),
            ],
          ),
        ),
      ),
    );
  }
}
