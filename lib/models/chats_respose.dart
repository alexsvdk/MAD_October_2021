import 'package:json_annotation/json_annotation.dart';
import 'package:ws_start/models/message.dart';

import 'chat.dart';

part 'chats_respose.g.dart';

@JsonSerializable()
class ChatsResponse {
  final Chat chat;
  final ChatMessage? lastMessage;

  ChatsResponse(this.chat, this.lastMessage);

  factory ChatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsResponseToJson(this);
}
