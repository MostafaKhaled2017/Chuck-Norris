import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Joke.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Joke {
  @JsonKey(name: 'created_at')
  @HiveField(0)
  String? creationDate;

  @JsonKey(name: 'icon_url')
  @HiveField(1)
  String? iconUrl;

  @HiveField(2)
  String? id;

  @HiveField(3)
  @JsonKey(name: 'updated_at')
  String? updatedAt;


  @HiveField(4)
  String? url;

  @HiveField(5)
  String? value;

  Joke({this.value, this.iconUrl});

  factory Joke.fromJson(Map<String, dynamic> json) => $JokeFromJson(json);
  Map<String, dynamic> toJson() => $JokeToJson(this);

  @override
  String toString() {
    return 'value: ${value!}';
  }
}
