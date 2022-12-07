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

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

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
                      'Forgot Password',
                      style: CustomTextStyle.standardStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppSize.paddingAll16,
                child: Text(
                  value.isSelectMail
                      ? "Code has been send to samadbayli.ilkin@gmail.com"
                      : "Code has been send to +994 70 742 24 21",
                  style: CustomTextStyle.tinyStyleItalic,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: AppSize.padding50x80,
                child: DotsWidget(
                    count: value.inputPinCount, dots: value.numberOfDots),
              ),
              timer(),
              AppSize.sizeHeight50,
              GlobalButton(
                text: "Verify",
                onTap: () {
                  if (value.currentPin == '4321') {
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

  Widget timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Resend code in",
          style: CustomTextStyle.tinyStyle,
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 30, end: 0),
          duration: const Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00: ${value.toDouble().toStringAsFixed(0)}",
            style: CustomTextStyle.tinyStyleGray,
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
