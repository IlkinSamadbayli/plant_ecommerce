import 'package:flutter/material.dart';

import '../../styles/colors/app_colors.dart';

class GlobalInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isCorrect;
  final Function(String) onChanged;

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
  }) : super(key: key);

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  bool clicked = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Form(
        child: TextFormField(
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: widget.isPassword ? clicked : false,
          decoration: InputDecoration(
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
            hintStyle: TextStyle(color: AppColor.hintTextColor),
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
                    ? AppColor.focusColor
                    : AppColor.errorColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColor.mainColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColor.errorColor,
              ),
            ),
            focusColor: AppColor.focusColor,
          ),
        ),
      ),
    );
  }
}
