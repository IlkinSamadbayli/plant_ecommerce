import 'package:flutter/material.dart';

import 'package:plant_ecommerce/global/snackbar/snackbar.dart';
import 'package:plant_ecommerce/styles/styles/border_style.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

import '../../styles/colors/app_colors.dart';

class GlobalInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isCorrect;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final FocusNode textFocus;
  final bool enabled;

  const GlobalInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isPassword,
    required this.keyboardType,
    this.validator,
    required this.isCorrect,
    required this.onChanged,
    required this.controller,
    required this.textFocus,
    required this.enabled,
  }) : super(key: key);

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  final formKey = GlobalKey<FormState>();

  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      child: TextFormField(
        
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        focusNode: widget.textFocus,
        controller: widget.controller,
        onEditingComplete: () => context.goNextFocus,
        textInputAction: TextInputAction.done,
        onChanged: widget.onChanged,
        validator: widget.validator,
        style: CustomTextStyle.tinyStyleItalic,
        obscureText: widget.isPassword ? clicked : false,
        decoration: InputDecoration(
          // counterStyle: CustomTextStyle.standardStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      clicked = !clicked;
                    });
                  },
                  child: clicked
                      ? Icon(Icons.visibility, color: AppColor.primaryColor)
                      : Icon(Icons.visibility_off,
                          color: AppColor.primaryColor),
                )
              : widget.suffixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: CustomTextStyle.hintTextStyle,
          border: GlobalBorderStyle.borderStyle,
          focusedBorder: GlobalBorderStyle.focusBorderStyle(widget.isCorrect),
          enabledBorder: GlobalBorderStyle.enabledBorderStyle,
          errorBorder: GlobalBorderStyle.errorBorderStyle,
        ),
      ),
    );
  }
}
