import 'package:flutter/material.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';

extension ContextExtension on BuildContext {
  dynamic get snackbarErrorMessage =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar(isSuccess: false));
  dynamic get snackbarSuccessMessage =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar(isSuccess: true));

  dynamic snackBarMessage({required Color color, required String text}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: color,
          action: SnackBarAction(
            label: "Undo",
            textColor: AppColor.primaryColor,
            onPressed: () {},
          ),
        ),
      );

  dynamic snackBar({required bool isSuccess}) => SnackBar(
        content: isSuccess ? const Text("Success") : const Text("Error"),
        backgroundColor: isSuccess ? AppColor.mainColor : AppColor.errorColor,
        action: SnackBarAction(
          label: "Undo",
          textColor: AppColor.primaryColor,
          onPressed: () {},
        ),
      );
  dynamic get goNextFocus => FocusScope.of(this).nextFocus();
}
