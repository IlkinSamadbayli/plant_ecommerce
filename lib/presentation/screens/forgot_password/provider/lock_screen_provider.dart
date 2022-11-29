import 'package:flutter/cupertino.dart';

class LockProvider extends ChangeNotifier {
  bool isSelectNumber = false;
  bool isSelectMail = false;
  late int numberOfDots = 4;
  late String currentPin = '';
  late int inputPinCount = 0;

  void setPin(int n, bool unset) {
    inputPinCount = currentPin.length;
    if (unset) {
      inputPinCount--;
      currentPin = currentPin.substring(0, inputPinCount);
    } else {
      if (inputPinCount < numberOfDots) {
        currentPin += n.toString();
        inputPinCount++;
      }
    }
    notifyListeners();
  }

  void get clearPin {
    inputPinCount = 0;
    currentPin = '';
    notifyListeners();
  }

  void sendMessage({required bool isMail}) {
    if (isMail) {
      isSelectMail = true;
      isSelectNumber = false;
    } else {
      isSelectMail = false;
      isSelectNumber = true;
    }
    notifyListeners();
  }
}
