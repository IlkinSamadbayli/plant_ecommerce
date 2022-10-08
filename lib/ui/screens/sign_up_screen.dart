import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/extensions/extension.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';
import 'package:plant_ecommerce/ui/screens/login_page.dart';

import '../../constants/routes/global_routes.dart';
import '../../styles/colors/app_colors.dart';
import '../widgets/global_button.dart';
import '../widgets/global_input.dart';
import '../widgets/global_validators.dart';
import '../widgets/social_network_row.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController mailController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  child: Image.asset('assets/images/sign_up_image.jpeg'),
                ),
              ),
              Text(
                "Create Your Account",
                style: CustomTextStyle.standardStyle,
              ),
              const SizedBox(height: 24),
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
                ),
                const SizedBox(height: 16),
                GlobalInput(
                  labelText: "Your password",
                  controller: passwordController,
                  isPassword: true,
                  validator: passValidator,
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
                text: 'Sign up',
                clicked: true,
                isIcon: false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print("true");
                  } else {
                    print("error");
                    context.snackbarErrorMessage;
                  }
                },

                // GlobalRoutes.to(context, const AccountSetup());
              ),
              const SizedBox(height: 24),
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
                  Text('Already have an account?',
                      style: CustomTextStyle.tinyStyleItalic),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      GlobalRoutes.to(context, const LoginPage());
                    },
                    child: Text(
                      'Sign in',
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
    );
  }
}
