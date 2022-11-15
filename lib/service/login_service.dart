









// class LoginService {
//   static Future<String> loginService(
//       {required String email, required String password}) async {
//     await Future.delayed(const Duration(seconds: 3));
//     if (email == "samadbayli.ilkin@gmail.com") {
//       return 'Successful login';
//     } else {
//       return throw Exception();
//     }
//   }
// }
//     import '../constants/api_constants.dart';

// Uri url = Uri.parse(ApiConstant.loginApiUrl);

//     var body = {"email": email, "password": password};

//     http.Response response = await http.post(url, body: body);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print(data);
//       return LoginSuccessModel.fromJson(data);
//     } else {
//       throw Exception();
//     }

