import 'package:flutter/cupertino.dart';

class LockProvider extends ChangeNotifier {
  bool isSelectNumber = false;
  bool isSelectMail = false;

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
