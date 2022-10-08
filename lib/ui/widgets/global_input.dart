import 'package:flutter/material.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';

import '../../styles/colors/app_colors.dart';

class GlobalInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isCorrect;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final FocusNode textFocus;

  const GlobalInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isPassword,
    this.validator,
    required this.isCorrect,
    required this.onChanged,
    required this.controller,
    required this.textFocus,
  }) : super(key: key);

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        controller: widget.controller,
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
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : widget.suffixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColor.hintTextColor,
            fontFamily: "Josefin Sans",
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.focusColor,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: widget.isCorrect
                  ? AppColor.primaryColor
                  : AppColor.errorColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color:
                  widget.isCorrect ? AppColor.mainColor : AppColor.errorColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.errorColor,
            ),
          ),
        ),
      ),
    );
  }
}
