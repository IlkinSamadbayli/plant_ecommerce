import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/verify_screen.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_button.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/widgets/verify_tipe_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSelectNumber = false;
  bool isSelectMail = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: AppSize.paddingAll24,
                child: Text(
                  'Forgot Password',
                  style: CustomTextStyle.standardStyle,
                ),
              ),
              Image.asset(
                GlobalAssets.forgot,
                width: 500,
                height: 350,
              ),
              Container(
                padding: AppSize.paddingH20,
                child: Text(
                  "Select which contact details should we use to reset your password",
                  style: CustomTextStyle.tinyStyleGray,
                ),
              ),
              AppSize.sizeHeight16,
              VerifyWidget(
                  isSelected: isSelectNumber,
                  ontap: () {
                    setState(() {
                      isSelectNumber = true;
                      isSelectMail = false;
                    });
                  },
                  image: Image.asset(GlobalAssets.threeDots, width: 50),
                  isMail: false),
              VerifyWidget(
                  isSelected: isSelectMail,
                  ontap: () {
                    setState(() {
                      isSelectMail = true;
                      isSelectNumber = false;
                    });
                  },
                  image: Image.asset(GlobalAssets.verify, width: 50),
                  isMail: true),
              AppSize.sizeHeight20,
              GlobalButton(
                text: 'Continue',
                onTap: () {
                  if (isSelectMail == false && isSelectNumber == false) {
                    context.snackBarMessage(
                      color: AppColor.errorColor,
                      text: "You should select via mail or number",
                    );
                  } else {
                    if (isSelectNumber == true) {
                      Get.to(() => const VerifyScreen(isMail: false));
                    } else {
                      Get.to(() => const VerifyScreen(isMail: true));
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
