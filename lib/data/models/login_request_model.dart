class LoginRequestModel {
  final String username;
  final String password;
  final String grantType;

  LoginRequestModel(
      {required this.username,
      required this.password,
      required this.grantType});

  Map<String, String> toMap() {
    return {
      "username": username,
      "password": password,
      "grant_type": grantType,
    };
  }
}
