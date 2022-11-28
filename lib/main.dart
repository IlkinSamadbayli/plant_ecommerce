import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plant_ecommerce/presentation/screens/home/home_screen.dart';
import 'package:plant_ecommerce/presentation/screens/home/components/provider/home_provider.dart';
import 'package:plant_ecommerce/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:plant_ecommerce/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? email;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPreference();
  runApp(ChangeNotifierProvider(
      create: (context) => HomeProvider(), child: const MyApp()));
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
      home:
          //  email==null||email==''? const LoginPage(): const HomeScreen(),
          const SignUp(),
    );
  }
}
