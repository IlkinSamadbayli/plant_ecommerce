import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/routes/global_routes.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';
import 'package:plant_ecommerce/ui/screens/account_setup.dart';
import 'package:plant_ecommerce/ui/screens/sign_up_screen.dart';

import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import 'package:plant_ecommerce/ui/widgets/global_input.dart';

import '../../constants/extensions/extension.dart';
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
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: Image.asset(
                      'assets/images/login_2.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Login to Your Account",
                    style: CustomTextStyle.standardStyle,
                  ),
                  const SizedBox(height: 16),
                  Column(children: [
                    GlobalInput(
                      labelText: "Your email",
                      controller: mailController,
                      isPassword: false,
                      validator: emailValidator,
                      prefixIcon: const Icon(Icons.mail),
                      isCorrect: isTrueMail,
                      onChanged: (mail) {
                        setState(() {});
                        if (!mail.contains("@") ||
                            !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$')
                                .hasMatch(mail)) {
                          isTrueMail = false;
                        } else {
                          isTrueMail = true;
                        }
                      },
                      textFocus: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    GlobalInput(
                      labelText: "Your password",
                      controller: passwordController,
                      isPassword: true,
                      validator: passwordValidator,
                      prefixIcon: const Icon(Icons.lock),
                      isCorrect: isTruePassword,
                      onChanged: (password) {
                        setState(() {});
                        if (password.length < 8 ||
                            !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(password)) {
                          isTruePassword = false;
                        } else {
                          isTruePassword = true;
                        }
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
                  globalButton(
                    text: 'Sign in',
                    clicked: true,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        GlobalRoutes.to(context, const AccountSetup());
                      } else {
                        GlobalRoutes.to(context, const AccountSetup());

                        context.snackbarErrorMessage;
                      }
                    },

                    // GlobalRoutes.to(context, const AccountSetup());
                    isIcon: false,
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    child: Text(
                      'Forgot the password?',
                      style: CustomTextStyle.tinyStyleItalic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'or continue with',
                    style: CustomTextStyle.tinyStyleGray,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        socialNetworkRow(
                          widget: Icon(
                            Icons.facebook_rounded,
                            color: AppColor.focusColor,
                            size: 36,
                          ),
                          onTap: () {},
                        ),
                        socialNetworkRow(
                          widget: Image.asset(
                            './assets/images/google.png',
                          ),
                          onTap: () {},
                        ),
                        socialNetworkRow(
                          widget: Icon(
                            Icons.apple,
                            size: 36,
                            color: AppColor.textColor,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',
                          style: CustomTextStyle.tinyStyleItalic),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          GlobalRoutes.to(context, const SignUp());
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
}
