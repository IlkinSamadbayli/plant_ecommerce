// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_button.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_input.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_validators.dart';
import 'package:plant_ecommerce/presentation/screens/forgot_password/lock_screen.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/gender_selection.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/provider/register_provider.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:plant_ecommerce/provider/onchanged_provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:provider/provider.dart';

class AccountSetup extends StatefulWidget {
  final TextEditingController mailController;
  const AccountSetup({
    Key? key,
    required this.mailController,
  }) : super(key: key);

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController nameController;
  late TextEditingController nickController;
  late TextEditingController dateController;
  late TextEditingController numberController;
  late TextEditingController genderController;
  late TextEditingController passwordController;

  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode nameFocus;
  late FocusNode nickFocus;
  late FocusNode dateFocus;
  late FocusNode genderFocus;
  late FocusNode numberFocus;
  bool isCorrectMail = false;
  bool isCorrectPassword = false;
  bool isCorrectName = false;
  bool isCorrectNick = false;
  bool isCorrectNumber = false;

  DateTime selectedDate = DateTime.now();

  SignUp signup = const SignUp();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    passwordController = TextEditingController();
    nameController = TextEditingController();
    nickController = TextEditingController();
    dateController =
        TextEditingController(text: selectedDate.toString().split(' ')[0]);
    genderController = TextEditingController();
    numberController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    nameFocus = FocusNode();
    nickFocus = FocusNode();
    dateFocus = FocusNode();
    genderFocus = FocusNode();
    numberFocus = FocusNode();
    selectedDate = DateTime(1995, 6, 10);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    nickController.dispose();
    dateController.dispose();
    numberController.dispose();
    nameFocus.dispose();
    nickFocus.dispose();
    dateFocus.dispose();
    numberFocus.dispose();
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
          }else if (numberFocus.hasFocus) {
            numberFocus.unfocus();
          }else if (nickFocus.hasFocus) {
            nickFocus.unfocus();
          }else if (nameFocus.hasFocus) {
            nameFocus.unfocus();
          }else if (dateFocus.hasFocus) {
            dateFocus.unfocus();
          }
        },
        child: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: AppSize.padding20x10,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                        AppSize.sizeWidth10,
                        Text(
                          'Fill Your Profile',
                          style: CustomTextStyle.standardStyle,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: AppSize.padding20x120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(GlobalAssets.avatar),
                      ),
                      Positioned(
                        right: 130,
                        bottom: 20,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: GlobalBorderStyle.borderRadius12,
                            color: AppColor.primaryColor,
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
                  Consumer<OnchangedProvider>(
                    builder: (context, value, child) => GlobalInput(
                      enabled: true,
                      labelText: "Full Name",
                      isPassword: false,
                      validator: nameValidator,
                      controller: nameController,
                      isCorrect: isCorrectName,
                      onChanged: (name) {
                        value.nameOnChanged(name, isCorrectName);
                      },
                      textFocus: nameFocus,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Consumer<OnchangedProvider>(
                    builder: (context, value, child) => GlobalInput(
                      enabled: true,
                      labelText: "Nickname",
                      isPassword: false,
                      validator: nickValidator,
                      controller: nickController,
                      isCorrect: isCorrectNick,
                      onChanged: (name) {
                        value.nameOnChanged(name, isCorrectNick);
                      },
                      textFocus: nickFocus,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(36))),
                        context: context,
                        builder: (context) {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              AppSize.sizeHeight50,
                              DatePickerWidget(
                                  initialDate: DateTime.now(),
                                  onConfirm: (dateTime, selectedIndex) {},
                                  looping: false, // default is not looping
                                  firstDate:
                                      DateTime(1920 - 01 - 01), //DateTime(1960),
                                  lastDate: DateTime.now(),
                                  dateFormat: "yyyy/MMMM/dd",
                                  onChange: (DateTime currentDate, _) {
                                    setState(() {
                                      dateController.text =
                                          currentDate.toString().split(' ')[0];
                                    });
                                  },
                                  pickerTheme: DateTimePickerTheme(
                                    itemTextStyle:
                                        CustomTextStyle.littleStyleItalic,
                                  )),
                              AppSize.sizeHeight20,
                              GlobalButton(
                                text: "Select birthday",
                                onTap: () {
                                  Get.back();
                                },
                              ),
                              AppSize.sizeHeight20,
                            ],
                          );
                        },
                      );
                    },
                    child: GlobalInput(
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: AppColor.primaryColor,
                      ),
                      labelText: 'Date of Birth',
                      isPassword: false,
                      keyboardType: TextInputType.number,
                      isCorrect: true,
                      onChanged: (date) {},
                      controller: dateController,
                      textFocus: dateFocus,
                      enabled: false,
                    ),
                  ),
                  Consumer<OnchangedProvider>(
                    builder: (context, value, child) => GlobalInput(
                      enabled: true,
                      labelText: "Your email",
                      controller: widget.mailController,
                      isPassword: false,
                      validator: emailValidator,
                      prefixIcon: Icon(Icons.mail, color: AppColor.primaryColor),
                      isCorrect: isCorrectMail,
                      onChanged: (mail) {
                        value.emailOnChanged(mail, isCorrectMail);
                      },
                      textFocus: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: AppSize.padding8x32,
                    child: Consumer<OnchangedProvider>(
                      builder: (context, provider, child) =>
                          InternationalPhoneNumberInput(
                        onInputChanged: (value) {
                          provider.numberOnchanged(value, isCorrectNumber);
                        },
                        keyboardType: TextInputType.number,
                        textFieldController: numberController,
                        hintText: "Phone Number",
                        textStyle: CustomTextStyle.hintTextStyle,
                        focusNode: numberFocus,
                        validator: numberValidator,
                        inputBorder:
                            GlobalBorderStyle.focusBorderStyle(isCorrectNumber),
                      ),
                    ),
                  ),
                  AppSize.sizeHeight16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Gender",
                        style: CustomTextStyle.littleStyle,
                      ),
                      Consumer<RegisterProvider>(
                        builder: (context, value, child) => Row(
                          children: [
                            GenderSelection(
                              text: "Male",
                              checkboxValue: value.checkboxOne,
                              ontap: (v) => value.genderbox(true),
                            ),
                            AppSize.sizeWidth8,
                            GenderSelection(
                              text: "Female",
                              checkboxValue: value.checkboxTwo,
                              ontap: (v) => value.genderbox(false),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSize.sizeHeight10,
                  GlobalButton(
                    text: "Continue",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(() => const LockScreen());
                      } else {
                        context.snackbarErrorMessage;
                      }
                    },
                  ),
                  AppSize.sizeHeight30
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
