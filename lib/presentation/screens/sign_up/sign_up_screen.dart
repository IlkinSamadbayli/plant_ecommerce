import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_button.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_input.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_validators.dart';
import 'package:plant_ecommerce/presentation/screens/onboard/widgets/social_network_row.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/presentation/screens/login/login_page.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_onchanged.dart';
import 'account_setup.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController mailController;
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: AppSize.paddingTop100,
                child: Image.asset(GlobalAssets.signup),
              ),
              Text(
                "Create Your Account",
                style: CustomTextStyle.standardStyle,
              ),
              AppSize.sizeHeight24,
              Column(children: [
                GlobalInput(
                  enabled: true,
                  labelText: "Your email",
                  controller: mailController,
                  isPassword: false,
                  validator: emailValidator,
                  prefixIcon: const Icon(Icons.mail),
                  isCorrect: isTrueMail,
                  onChanged: (email) {
                    setState(() {
                      emailOnChanged(email, isTrueMail);
                    });
                  },
                  textFocus: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                ),
                AppSize.sizeHeight16,
                GlobalInput(
                  enabled: true,
                  labelText: "Your password",
                  controller: passwordController,
                  isPassword: true,
                  validator: passwordValidator,
                  prefixIcon: const Icon(Icons.lock),
                  isCorrect: isTruePassword,
                  onChanged: (password) {
                    setState(() {
                      passwordOnChanged(password, isTruePassword);
                    });
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
                text: 'Sign up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.snackbarSuccessMessage;
                    Get.to(() => AccountSetup(mailController: mailController));
                  } else {
                    context.snackbarErrorMessage;
                  }
                },
              ),
              AppSize.sizeHeight24,
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
                  Text('Already have an account?',
                      style: CustomTextStyle.tinyStyleItalic),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Get.to(() => const LoginPage());
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
