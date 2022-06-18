import 'package:json_annotation/json_annotation.dart';

part 'Joke.g.dart';

@JsonSerializable()
class Joke {
  @JsonKey(name: 'created_at')
  String? creationDate;
  @JsonKey(name: 'icon_url')
  String? iconUrl;
  String? id;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  String? url;
  String? value;

  Joke({this.value, this.iconUrl});

  factory Joke.fromJson(Map<String, dynamic> json) => $JokeFromJson(json);
  Map<String, dynamic> toJson() => $JokeToJson(this);

  @override
  String toString() {
    return 'value: ${value!}';
  }
}
