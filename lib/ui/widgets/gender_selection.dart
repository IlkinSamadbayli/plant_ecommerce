import 'package:flutter/material.dart';

import '../../styles/colors/app_colors.dart';
import '../../styles/styles/text_style.dart';

class GenderSelection extends StatelessWidget {
  final String text;
  final bool checkboxValue;
  final void Function(bool?)? ontap;
  const GenderSelection({
    Key? key,
    required this.text,
    required this.checkboxValue,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
