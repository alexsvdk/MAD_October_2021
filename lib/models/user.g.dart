// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['userId'] as String,
      json['name'] as String? ?? '',
      json['aboutMyself'] as String? ?? '',
      json['avatar'] as String?,
      (json['topics'] as List<dynamic>)
          .map((e) => UserTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'aboutMyself': instance.aboutMyself,
      'avatar': instance.avatar,
      'topics': instance.topics,
    };

UserTopic _$UserTopicFromJson(Map<String, dynamic> json) => UserTopic(
      json['id'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$UserTopicToJson(UserTopic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
