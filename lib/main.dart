import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plant_ecommerce/presentation/screens/login/login_page.dart';
import 'package:plant_ecommerce/providers/provider.dart';
import 'package:plant_ecommerce/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? email;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPreference();
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

Future<void> getPreference() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString("email");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant-Ecommerce',
      theme: AppThemes.appTheme,
      home: const LoginPage(),
      //  email==null||email==''? const LoginPage(): const HomeScreen(),
    );
  }
}
