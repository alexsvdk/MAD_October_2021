import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserData {
  final String userId;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String aboutMyself;
  final String? avatar;
  final List<UserTopic> topics;

  UserData(this.userId, this.name, this.aboutMyself, this.avatar, this.topics);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class UserTopic {
  final String id;
  final String title;

  UserTopic(this.id, this.title);

  factory UserTopic.fromJson(Map<String, dynamic> json) =>
      _$UserTopicFromJson(json);
  Map<String, dynamic> toJson() => _$UserTopicToJson(this);
}
