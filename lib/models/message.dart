import 'package:json_annotation/json_annotation.dart';
import 'package:ws_start/models/user.dart';

part 'message.g.dart';

@JsonSerializable()
class ChatMessage {
  final String id;
  final String text;
  final String createdAt;
  final UserData user;

  ChatMessage(this.id, this.text, this.createdAt, this.user);

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
