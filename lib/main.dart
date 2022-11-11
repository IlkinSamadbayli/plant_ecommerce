import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plant_ecommerce/providers/provider.dart';
import 'package:plant_ecommerce/themes/app_themes.dart';
import 'package:plant_ecommerce/ui/screens/onboard/onboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant-Ecommerce',
      theme: appTheme,
      home: const OnboardPage(),
    );
  }
}
