import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:plant_ecommerce/bloc/login/login_bloc.dart';
import 'package:plant_ecommerce/themes/app_themes.dart';
import 'package:plant_ecommerce/ui/screens/forgot_password/forgot_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FireBase.initializaApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant-Ecommerce',
        theme: appTheme,
        home: const ForgotPassword(),
      ),
    );
  }
}
