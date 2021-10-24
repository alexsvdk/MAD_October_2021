import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
  final String test;

  Example(this.test);

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
