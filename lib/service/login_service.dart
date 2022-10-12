import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../model/login_success_model.dart';

class LoginService {
 static Future<dynamic> loginService(
      {required String email, required String password}) async {
    Uri url = Uri.parse(ApiConstant.loginApiUrl);

    var body = {"email": email, "password": password};

    http.Response response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return LoginSuccessModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
