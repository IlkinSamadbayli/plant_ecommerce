import 'package:flutter/material.dart';

MaterialPageRoute route(Widget screen) =>
    MaterialPageRoute<void>(builder: (_) => screen);

class GlobalRoutes {
  static void to(BuildContext ctx, Widget screen) {
    Navigator.push<void>(ctx, route(screen));
  }

  static void off(BuildContext ctx, Widget screen) {
    Navigator.pushReplacement(ctx, route(screen));
  }

  static void back(BuildContext ctx) {
    Navigator.pop(ctx);
  }
}
