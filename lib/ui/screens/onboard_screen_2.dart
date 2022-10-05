import 'package:flutter/material.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import '../../styles/colors/app_colors.dart';

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
          const Text(
            'Let\'s you in',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook_rounded,
                          size: 40,
                          color: AppColor.focusColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(
                              fontSize: 24, color: AppColor.textColor),
                        ),
                      ]),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Image.asset('./assets/images/google.png'),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontSize: 24, color: AppColor.textColor),
                        ),
                      ]),
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.apple_rounded,
                          size: 40,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Continue with Apple',
                          style: TextStyle(
                              fontSize: 24, color: AppColor.textColor),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'or',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          globalButton(
            text: 'Sign in with password',
            clicked: true,
            onTap: () {},
            isIcon: false,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  // GlobalRoutes.to(context, const SignUp());
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.focusColor,
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
