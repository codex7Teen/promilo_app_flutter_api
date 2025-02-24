// AUTH SERVICES
import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:promilo_flutter_app/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:promilo_flutter_app/data/models/login_request_model.dart';

class AuthServices {
  static const String _baseUrl = "https://api.promilo.com/user/oauth/token";
  static const String _authHeaderValue =
      "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==";

  // Function to convert password to SHA256
  static String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  //! LOGIN SERVICE FUNCTION
  static Future<LoginModel?> loginUser(String email, String password) async {
    try {
      final hashedPassword = hashPassword(password);
      var headers = {
        "Authorization": _authHeaderValue,
        "Content-Type": "application/x-www-form-urlencoded"
      };

      // creating the login body
      LoginRequestModel loginRequest = LoginRequestModel(
          username: email, password: hashedPassword, grantType: "password");

      var response = await http.post(Uri.parse(_baseUrl),
          headers: headers, body: loginRequest.toMap());
      log('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return LoginModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 400) {
        throw "Invalid email or password";
      } else if (response.statusCode == 401) {
        throw "Unauthorized: Invalid credentials";
      } else if (response.statusCode == 500) {
        throw "Server error. Please try again later.";
      } else {
        throw "Unexpected error: ${response.statusCode}";
      }
    } catch (error) {
      throw "Unknown error. Make sure id and password is correct.";
    }
  }
}
