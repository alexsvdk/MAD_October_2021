import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/models/auth.dart';
import 'package:ws_start/models/register.dart';
import 'package:ws_start/models/token.dart';
import 'package:ws_start/net/api.dart';

class AuthDataNotifyer extends StateNotifier<TokenResponse?> {
  static String? token;
  final Api _api;

  AuthDataNotifyer(this._api) : super(null);

  Future<void> setToken(TokenResponse token) async {
    state = token;
    AuthDataNotifyer.token = token.accessToken;
  }

  Future<void> register(String emain, String password) async {
    final res = await _api.register(RegisterRequest(emain, password));
    setToken(res);
  }
}
