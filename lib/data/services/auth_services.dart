import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:promilo_flutter_app/data/models/login_model.dart';
import 'package:http/http.dart' as http;

//! AUTH SERVICES
class AuthServices {
  static const String _baseUrl = "https://api.promilo.com/user/oauth/token";
  static const String _authHeaderValue =
      "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==";

  // Fuction to convert password to SHA256
  static String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  //! LOGIN SERVICE FUNCTION
  static Future<LoginModel?> loginUser(String email, String password) async {
    try {
      final hashedPassword = hashPassword(password);
      // header
      var headers = {
        "Authorization": _authHeaderValue,
        "Content-Type": "application/x-www-form-urlencoded"
      };
      // body
      var body = {
        "username": email,
        "password": hashedPassword,
        "grant_type": "password"
      };
      // response
      var response =
          await http.post(Uri.parse(_baseUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        log('Services: Response 200 success');
        return LoginModel.fromJson(json.decode(response.body));
      } else {
        log('Services: Response error ${response.statusCode}');
        return null;
      }
    } catch (error) {
      throw Exception("Error: Failed to get data");
    }
  }
}
