import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/screens/account_setup.dart';
import 'package:plant_ecommerce/ui/screens/forgot_password/forgot_screen.dart';
import 'package:plant_ecommerce/ui/screens/sign_up_screen.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import 'package:plant_ecommerce/ui/widgets/global_input.dart';
import 'package:plant_ecommerce/ui/widgets/global_onchanged.dart';
import '../../global/snackbar/snackbar.dart';
import '../../styles/colors/app_colors.dart';
import '../widgets/global_validators.dart';
import '../widgets/social_network_row.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController mailController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  bool isChecked = false;
  bool isTrueMail = false;
  bool isTruePassword = false;

  @override
  void initState() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          emailFocus.unfocus();
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  AppSize.sizeHeight80,
                  Padding(
                    padding: AppSize.paddHorizontal110,
                    child: Image.asset(GlobalAssets.login_2),
                    //  Image.asset(
                    //   'assets/images/login_2.png',
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ),
                  AppSize.sizeHeight30,
                  Text(
                    "Login to Your Account",
                    style: CustomTextStyle.standardStyle,
                  ),
                  const SizedBox(height: 16),
                  Column(children: [
                    GlobalInput(
                      enabled: true,
                      labelText: "Your email",
                      controller: mailController,
                      isPassword: false,
                      validator: emailValidator,
                      prefixIcon: const Icon(Icons.mail),
                      isCorrect: isTrueMail,
                      onChanged: (mail) {
                        emailOnChanged(mail, isTrueMail);
                      },
                      textFocus: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    GlobalInput(
                      enabled: true,
                      labelText: "Your password",
                      controller: passwordController,
                      isPassword: true,
                      validator: passwordValidator,
                      prefixIcon: const Icon(Icons.lock),
                      isCorrect: isTruePassword,
                      onChanged: (p0) {
                        emailOnChanged(p0, isTruePassword);
                        setState(() {});
                      },
                      textFocus: passwordFocus,
                      keyboardType: TextInputType.text,
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        activeColor: AppColor.primaryColor,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: CustomTextStyle.tinyStyleItalic,
                      ),
                    ],
                  ),
                  GlobalButton(
                    text: 'Sign in',
                    clicked: true,
                    isIcon: false,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        {
                          Get.to(() => const AccountSetup());

                          context.snackbarSuccessMessage;
                        }
                      } else {
                        context.snackbarErrorMessage;
                      }
                    },
                  ),
                  AppSize.sizeHeight32,
                  InkWell(
                    onTap: () {
                      Get.to(() => const ForgotPassword());
                    },
                    child: Text(
                      'Forgot the password?',
                      style: CustomTextStyle.tinyStyleItalic,
                    ),
                  ),
                  AppSize.sizeHeight16,
                  Text(
                    'or continue with',
                    style: CustomTextStyle.tinyStyleGray,
                  ),
                  Padding(
                    padding: AppSize.paddingAll24,
                    child: const SocialNetwork(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',
                          style: CustomTextStyle.tinyStyleItalic),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Get.to(() => const SignUp());
                        },
                        child: Text(
                          'Sign up',
                          style: CustomTextStyle.tinyStyleBold
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void onDone() {
  //   () => context.goNextFocus;
  //   // GlobalRoutes.to(context, const AccountSetup());
  // }
}
