import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/presentation/screens/login/login_provider.dart';
import 'package:plant_ecommerce/presentation/screens/onboard/onboard_screen.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/provider/register_provider.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/forgot_password/provider/lock_screen_provider.dart';
import 'presentation/screens/home/home_provider.dart';
import 'provider/onchanged_provider.dart';
import 'themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnchangedProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => LockProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant-Ecommerce',
        theme: AppThemes.appTheme,
        home: const OnboardPage(),
        //  email==null||email==''? const LoginPage(): const HomeScreen(),
      ),
    );
  }
}
