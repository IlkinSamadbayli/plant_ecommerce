import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

String? email;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await getPreference();
  runApp(const MyApp());
}

Future<void> getPreference() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString("email");
}
