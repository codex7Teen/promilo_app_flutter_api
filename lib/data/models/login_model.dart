// LOGIN MODEL
class LoginModel {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String userType;
  final String userName;

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.userType,
    required this.userName
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json["response"]["access_token"],
      refreshToken: json["response"]["refresh_token"],
      userId: json["response"]["user_id"],
      userType: json["response"]["user_type"],
      userName: json["response"]["user_name"] ?? "User",
    );
  }
}
