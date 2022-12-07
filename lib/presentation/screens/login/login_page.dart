import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/data/login_data.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/presentation/screens/login/login_provider.dart';
import 'package:plant_ecommerce/provider/onchanged_provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_validators.dart';
import 'package:plant_ecommerce/presentation/screens/home/home_screen.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/forgot_screen.dart';
import 'package:plant_ecommerce/presentation/screens/onboard/widgets/social_network_row.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_button.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // bool isChecked = false;
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
          if (emailFocus.hasFocus) {
            emailFocus.unfocus();
          } else if (passwordFocus.hasFocus) {
            passwordFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AppSize.sizeHeight80,
                Padding(
                  padding: AppSize.paddingH110,
                  child: Image.asset(GlobalAssets.login_2),
                ),
                AppSize.sizeHeight30,
                Text(
                  "Login to Your Account",
                  style: CustomTextStyle.standardStyle,
                ),
                AppSize.sizeHeight16,
                Column(
                  children: [
                    Consumer<OnchangedProvider>(
                      builder: (context, value, child) => GlobalInput(
                        enabled: true,
                        labelText: "Your email",
                        controller: mailController,
                        isPassword: false,
                        validator: (mail) {
                          if (mail == '') {
                            return "Please fill your email";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(Icons.mail),
                        isCorrect: isTrueMail,
                        onChanged: (mail) {
                          value.emailOnChanged(mail, isTrueMail);
                        },
                        textFocus: emailFocus,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Consumer<OnchangedProvider>(
                      builder: (context, value, child) => GlobalInput(
                        enabled: true,
                        labelText: "Your password",
                        controller: passwordController,
                        isPassword: true,
                        validator: passwordValidator,
                        prefixIcon: const Icon(Icons.lock),
                        isCorrect: isTruePassword,
                        onChanged: (p0) {
                          value.passwordOnChanged(p0, isTruePassword);
                        },
                        textFocus: passwordFocus,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<LoginProvider>(
                      builder: (_, appProvider, child) => Checkbox(
                        shape: const CircleBorder(),
                        activeColor: AppColor.primaryColor,
                        value: appProvider.isChecked,
                        onChanged: (value) {
                          appProvider.checkbox;
                        },
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: CustomTextStyle.tinyStyleItalic,
                    ),
                  ],
                ),
                GlobalButton(
                  text: 'Sign in',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      var token = await LoginData.loginData(
                          mailController.text, passwordController.text);
                      if (token is String) {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString(
                            "email", mailController.text);
                        Get.off(() => const HomeScreen());
                        // "eve.holt@reqres.in"
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
                    Get.to(() => const ForgotScreen());
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
                    AppSize.sizeWidth4,
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
                AppSize.sizeHeight16
              ],
            ),
          ),
        ),
      ),
    );
  }
}
