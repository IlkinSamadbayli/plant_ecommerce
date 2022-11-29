import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier {
  bool isChecked = false;
  late bool checkboxOne = false;
  late bool checkboxTwo = false;

  void get checkBox {
    isChecked = !isChecked;
    notifyListeners();
  }

  void genderbox(bool ismale) {
    if (ismale) {
      checkboxOne = true;
      checkboxTwo = false;
    } else {
      checkboxOne = false;
      checkboxTwo = true;
    }
    notifyListeners();
  }
}
