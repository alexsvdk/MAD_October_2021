// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsResponse _$ChatsResponseFromJson(Map<String, dynamic> json) =>
    ChatsResponse(
      Chat.fromJson(json['chat'] as Map<String, dynamic>),
      json['lastMessage'] == null
          ? null
          : ChatMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatsResponseToJson(ChatsResponse instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'lastMessage': instance.lastMessage,
    };
