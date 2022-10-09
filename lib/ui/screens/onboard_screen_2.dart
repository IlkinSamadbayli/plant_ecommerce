import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/routes/global_routes.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';
import 'package:plant_ecommerce/ui/screens/login_page.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import '../../styles/colors/app_colors.dart';
import 'sign_up_screen.dart';

class EnterancePage extends StatelessWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Image.asset('assets/images/login_1.png'),
          ),
          Text('Let\'s you in', style: CustomTextStyle.largeBoldStyle),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                    padding: const EdgeInsets.symmetric(vertical: 4),
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
          const SizedBox(height: 32),
          Text('or', style: CustomTextStyle.tinyStyle),
          const SizedBox(height: 20),
          globalButton(
            text: 'Sign in with password',
            clicked: true,
            onTap: () {
              GlobalRoutes.to(context, const LoginPage());
            },
            isIcon: false,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: CustomTextStyle.tinyStyleItalic,
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  GlobalRoutes.to(context, const SignUp());
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
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: () {},
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        widget,
        const SizedBox(width: 8),
        Text(
          text,
          style: CustomTextStyle.littleStyle,
        ),
      ]),
    ),
  );
}
