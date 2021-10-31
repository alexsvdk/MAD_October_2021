// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      json['accessToken'] as String,
      json['accessTokenExpiredAt'] as String,
      json['refreshToken'] as String,
      json['refreshTokenExpiredAt'] as String,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'accessTokenExpiredAt': instance.accessTokenExpiredAt,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiredAt': instance.refreshTokenExpiredAt,
    };
