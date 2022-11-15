import 'dart:convert';

import 'package:http/http.dart';

class LoginData {
  static Future loginData() async {
    Uri url = Uri.parse('https://reqres.in/api/login');
    var body = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
    Response response = await post(url, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }
}
