import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/extensions/extension.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';
import 'package:plant_ecommerce/ui/screens/login_page.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import 'package:plant_ecommerce/ui/widgets/global_input.dart';

import '../../constants/routes/global_routes.dart';
import '../../styles/colors/app_colors.dart';
import '../widgets/global_validators.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({Key? key}) : super(key: key);

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController mailController;
  late TextEditingController nameController;
  late TextEditingController dateController;
  late TextEditingController numberController;
  late TextEditingController genderController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode nameFocus;
  late FocusNode dateFocus;
  late FocusNode genderFocus;
  late FocusNode numberFocus;
  bool isCorrectMail = false;
  bool isCorrectPassword = false;
  bool isCorrectName = false;
  bool isCorrectDate = false;
  late bool checkboxOne = false;
  late bool checkboxTwo = false;

  @override
  void initState() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    dateController = TextEditingController();
    genderController = TextEditingController();
    numberController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    nameFocus = FocusNode();
    dateFocus = FocusNode();
    genderFocus = FocusNode();
    numberFocus = FocusNode();
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
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          GlobalRoutes.back(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Fill Your Profile',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 20,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        './assets/images/avatar.jpeg',
                      ),
                    ),
                    Positioned(
                      right: 120,
                      bottom: 15,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.mainColor,
                        ),
                        child: IconButton(
                          highlightColor: AppColor.highlightColor,
                          onPressed: () {},
                          icon: Icon(
                            Icons.mode_edit_outlined,
                            size: 26,
                            color: AppColor.versionColorWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GlobalInput(
                  labelText: "Full Name",
                  isPassword: false,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Please Enter name";
                    } else if (!RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(name)) {
                      return "Incorrect name";
                    }
                    return null;
                  },
                  controller: nameController,
                  isCorrect: isCorrectName,
                  onChanged: (name) {
                    setState(() {});
                    if (name.isEmpty ||
                        !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(name)) {
                      isCorrectName = false;
                    } else {
                      isCorrectName = true;
                    }
                  },
                  textFocus: nameFocus,
                  keyboardType: TextInputType.name,
                ),
                GlobalInput(
                  labelText: "Date Of Birth",
                  suffixIcon: const Icon(Icons.date_range),
                  isPassword: false,
                  validator: (date) {
                    if (date!.isEmpty) {
                      return "Please Enter Birthday";
                    }
                    return null;
                  },
                  controller: dateController,
                  isCorrect: isCorrectDate,
                  onChanged: (date) {
                    setState(() {});
                    if (date.isEmpty) {
                      isCorrectDate = false;
                    } else {
                      isCorrectDate = true;
                    }
                  },
                  textFocus: dateFocus,
                  keyboardType: TextInputType.number,
                ),
                GlobalInput(
                  labelText: "Your email",
                  controller: mailController,
                  isPassword: false,
                  validator: emailValidator,
                  prefixIcon: const Icon(Icons.mail),
                  isCorrect: isCorrectMail,
                  onChanged: (mail) {
                    setState(() {});
                    if (!mail.contains("@") ||
                        !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$')
                            .hasMatch(mail)) {
                      isCorrectMail = false;
                    } else {
                      isCorrectMail = true;
                    }
                  },
                  textFocus: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                ),
                GlobalInput(
                  labelText: "Phone Number",
                  prefixIcon: const Icon(Icons.flag),
                  isPassword: false,
                  validator: (day) {
                    return day!.isEmpty ? "Please Enter Email" : null;
                  },
                  controller: numberController,
                  isCorrect: true,
                  onChanged: (number) {},
                  textFocus: numberFocus,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Gender",
                      style: CustomTextStyle.littleStyle,
                    ),
                    Row(
                      children: [
                        genderColumn(
                          text: "Male",
                          checkboxValue: checkboxOne,
                          ontap: (value) => setState(() {
                            checkboxOne = true;
                            checkboxTwo = false;
                          }),
                        ),
                        genderColumn(
                          text: "Female",
                          checkboxValue: checkboxTwo,
                          ontap: (value) => setState(() {
                            checkboxOne = false;
                            checkboxTwo = true;
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                globalButton(
                  text: "Continue",
                  clicked: true,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      GlobalRoutes.to(context, const LoginPage());
                    } else {
                      context.snackbarErrorMessage;
                    }
                    // GlobalRoutes.to(context, const LockScreen());
                  },
                  isIcon: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget genderColumn(
    {required String text,
    required bool checkboxValue,
    void Function(bool?)? ontap}) {
  return Column(
    children: [
      Text(
        text,
        style: CustomTextStyle.moreTinyStyle,
      ),
      Checkbox(
        activeColor: AppColor.primaryColor,
        shape: const CircleBorder(),
        value: checkboxValue,
        onChanged: ontap,
      ),
    ],
  );
}
