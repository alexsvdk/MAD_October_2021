import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenResponse {
  final String accessToken;
  final String accessTokenExpiredAt;
  final String refreshToken;
  final String refreshTokenExpiredAt;

  TokenResponse(this.accessToken, this.accessTokenExpiredAt, this.refreshToken,
      this.refreshTokenExpiredAt);

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
