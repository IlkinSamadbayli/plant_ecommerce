import 'package:flutter/material.dart';

abstract class OnchangedWidget extends StatefulWidget {
  const OnchangedWidget({
    Key? key,
  }) : super(key: key);
}

mixin OnchangedWidgetState implements State<OnchangedWidget> {
  late final String onchangedType;
  late bool isCorrect;

  void onchangedWidget(value) async {
    setState(() {});
    if (onchangedType == "password") {
      if (value.length < 8 || !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(value)) {
        isCorrect = false;
      } else {
        isCorrect = true;
      }
    }
    if (onchangedType == "mail") {
      if (!value.contains("@") ||
          !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$')
              .hasMatch(value)) {
        isCorrect = false;
      } else {
        isCorrect = true;
      }
    }
  }
}
