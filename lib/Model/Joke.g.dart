// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

part of 'Joke.dart';

Joke $JokeFromJson(Map<String, dynamic> json) => Joke(
      value: json['value'],
      iconUrl: json['icon_url'],
    )
      ..creationDate = json['created_at'] as String?
      ..url = json['url'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..id = json['id'] as String?
      ..value = json['value'] as String?
      ..iconUrl = json['icon_url'] as String?;

Map<String, dynamic> $JokeToJson(Joke instance) => <String, dynamic>{
      'created_at': instance.creationDate,
      'icon_url': instance.iconUrl,
      'value': instance.value,
      'url': instance.url,
      'updated_at': instance.updatedAt,
      'id': instance.id,
    };
