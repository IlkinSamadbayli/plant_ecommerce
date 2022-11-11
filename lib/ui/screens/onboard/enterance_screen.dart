import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/screens/login/login_page.dart';
import 'package:plant_ecommerce/ui/global_widgets/global_button.dart';
import '../../../styles/colors/app_colors.dart';
import '../../../styles/global_assets/global_assets.dart';
import '../sign_up/sign_up_screen.dart';

class EnterancePage extends StatelessWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSize.sizeHeight60,
          Padding(
            padding: AppSize.paddingH80,
            child: Image.asset(GlobalAssets.login_1),
          ),
          Text('Let\'s you in', style: CustomTextStyle.largeBoldStyle),
          AppSize.sizeHeight40,
          Padding(
            padding: AppSize.paddingH40,
            child: Column(
              children: [
                centerPage(
                  Icon(
                    Icons.facebook_rounded,
                    size: 40,
                    color: AppColor.focusColor,
                  ),
                  'Continue with Facebok',
                ),
                centerPage(
                  Padding(
                    padding: AppSize.paddingV4,
                    child: Image.asset('./assets/images/google.png'),
                  ),
                  'Continue with Google',
                ),
                centerPage(
                  const Icon(
                    Icons.apple_rounded,
                    size: 40,
                  ),
                  'Continue with Apple',
                ),
              ],
            ),
          ),
          AppSize.sizeHeight32,
          Text('or', style: CustomTextStyle.tinyStyle),
          AppSize.sizeHeight20,
          GlobalButton(
            text: 'Sign in with password',
            onTap: () {
              Get.to(() => const LoginPage());
            },
          ),
          AppSize.sizeHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: CustomTextStyle.tinyStyleItalic,
              ),
              AppSize.sizeWidth4,
              InkWell(
                onTap: () {
                  Get.to(() => const SignUp());
                },
                child: Text(
                  'Sign up',
                  style: CustomTextStyle.tinyStyleBold.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget centerPage(Widget widget, String text) {
  return Padding(
    padding: AppSize.paddingV10,
    child: InkWell(
      onTap: () {},
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        widget,
        AppSize.sizeWidth8,
        Text(
          text,
          style: CustomTextStyle.littleStyle,
        ),
      ]),
    ),
  );
}
