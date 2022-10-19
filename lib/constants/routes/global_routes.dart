import 'package:flutter/material.dart';

MaterialPageRoute route(Widget screen) =>
    MaterialPageRoute<void>(builder: (_) => screen);

extension GlobalRoutes on BuildContext {
  static void to(BuildContext contex, Widget screen) {
    Navigator.push<void>(contex, route(screen));
  }

  static void off(BuildContext ctx, Widget screen) {
    Navigator.pushReplacement(ctx, route(screen));
  }

  static void back(BuildContext ctx) {
    Navigator.pop(ctx);
  }
}
