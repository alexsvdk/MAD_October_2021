class AuthData {
  final String? token;
  final String? refreshToken;

  AuthData({this.token, this.refreshToken});

  bool get isAuthorized => token != null && refreshToken != null;
}
