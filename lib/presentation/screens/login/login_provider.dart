import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  bool isChecked = false;


void get checkbox {
isChecked = ! isChecked;
notifyListeners();
}
}