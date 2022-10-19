import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/themes/app_themes.dart';
import 'package:plant_ecommerce/ui/screens/lock_screen/lock_screen.dart';
import 'package:plant_ecommerce/ui/widgets/gender_selection.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import 'package:plant_ecommerce/ui/widgets/global_input.dart';
import 'package:plant_ecommerce/ui/widgets/global_onchanged.dart';

import '../../constants/routes/global_routes.dart';
import '../../styles/colors/app_colors.dart';
import '../widgets/global_validators.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({Key? key}) : super(key: key);

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController mailController;
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
  late bool checkboxOne = false;
  late bool checkboxTwo = false;

  DateTime selectedDate = DateTime.now();

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
    mailController = TextEditingController();
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
    mailController.dispose();
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 20,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        './assets/images/avatar.jpeg',
                        color: AppColor.hintTextColor,
                      ),
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
                GlobalInput(
                  enabled: true,
                  labelText: "Full Name",
                  isPassword: false,
                  validator: nameValidator,
                  controller: nameController,
                  isCorrect: isCorrectName,
                  onChanged: (name) {
                    setState(() {
                      nameOnChanged(name, isCorrectName);
                    });
                  },
                  textFocus: nameFocus,
                  keyboardType: TextInputType.name,
                ),
                GlobalInput(
                  enabled: true,
                  labelText: "Nickname",
                  isPassword: false,
                  validator: nickValidator,
                  controller: nickController,
                  isCorrect: isCorrectNick,
                  onChanged: (name) {
                    setState(() {
                      nameOnChanged(name, isCorrectNick);
                    });
                  },
                  textFocus: nickFocus,
                  keyboardType: TextInputType.name,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        GlobalBorderStyle.borderRadius40),
                                padding: AppSize.paddHorizontal25,
                                child: DatePickerWidget(
                                    initialDate: DateTime.now(),
                                    onConfirm: (dateTime, selectedIndex) {},
                                    looping: false, // default is not looping
                                    firstDate: DateTime(
                                        1920 - 01 - 01), //DateTime(1960),
                                    lastDate: DateTime.now(),
                                    dateFormat: "yyyy/MMMM/dd",
                                    onChange: (DateTime currentDate, _) {
                                      setState(() {
                                        dateController.text = currentDate
                                            .toString()
                                            .split(' ')[0];
                                      });
                                    },
                                    pickerTheme: DateTimePickerTheme(
                                      itemTextStyle:
                                          CustomTextStyle.littleStyle,
                                    )
                                    //  DateTimePickerTheme(
                                    //   backgroundColor: AppColor.primaryColor,
                                    //   itemTextStyle: CustomTextStyle.tinyStyle
                                    //       .copyWith(
                                    //           color: AppColor.versionColorWhite),
                                    //   dividerColor: AppColor.versionColorWhite,
                                    // ),
                                    ),
                              ),
                              AppSize.sizeHeight40,
                              GlobalButton(
                                text: "Select birthday",
                                isIcon: false,
                                clicked: true,
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
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
                GlobalInput(
                  enabled: true,
                  labelText: "Your email",
                  controller: mailController,
                  isPassword: false,
                  validator: emailValidator,
                  prefixIcon: Icon(Icons.mail, color: AppColor.primaryColor),
                  isCorrect: isCorrectMail,
                  onChanged: (mail) {
                    setState(() {
                      emailOnChanged(mail, isCorrectMail);
                    });
                  },
                  textFocus: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 8,
                  ),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (value) {
                      setState(() {
                        numberOnchanged(value, isCorrectNumber);
                      });
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
                AppSize.sizeHeight16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Gender",
                      style: CustomTextStyle.littleStyle,
                    ),
                    Row(
                      children: [
                        GenderSelection(
                          text: "Male",
                          checkboxValue: checkboxOne,
                          ontap: (value) => setState(() {
                            checkboxOne = true;
                            checkboxTwo = false;
                          }),
                        ),
                        AppSize.sizeWidth8,
                        GenderSelection(
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
                AppSize.sizeHeight10,
                GlobalButton(
                  text: "Continue",
                  clicked: true,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(() => const LockScreen());
                    } else {
                      context.snackbarErrorMessage;
                    }
                  },
                  isIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void getNumber(String phoneNumber) async {
//   PhoneNumber number =
//   await PhoneNumber.getRegionInfoFromPhoneNumber('707422421', 'AZE');
// }
