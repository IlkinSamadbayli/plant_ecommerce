import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isLiked = false;
  bool isNotificationOpen = false;

  void get notificationAppbar {
    isNotificationOpen = !isNotificationOpen;

    notifyListeners();
  }

  void get likedAppbarHome {
    isLiked = !isLiked;
    notifyListeners();
  }
}
