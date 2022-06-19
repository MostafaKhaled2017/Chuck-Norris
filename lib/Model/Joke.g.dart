// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final int typeId = 1;

  @override
  Joke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joke(
      value: fields[5] as String?,
      iconUrl: fields[1] as String?,
    )
      ..creationDate = fields[0] as String?
      ..id = fields[2] as String?
      ..updatedAt = fields[3] as String?
      ..url = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, Joke obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.creationDate)
      ..writeByte(1)
      ..write(obj.iconUrl)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke $JokeFromJson(Map<String, dynamic> json) => Joke(
      value: json['value'] as String?,
      iconUrl: json['icon_url'] as String?,
    )
      ..creationDate = json['created_at'] as String?
      ..id = json['id'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..url = json['url'] as String?;

Map<String, dynamic> $JokeToJson(Joke instance) => <String, dynamic>{
      'created_at': instance.creationDate,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value,
    };
