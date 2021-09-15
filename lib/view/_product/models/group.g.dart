// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    name: json['name'] as String,
    connections: (json['connections'] as List<dynamic>?)
        ?.map((e) => Connection.fromJson((e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )))
        .toList(),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'name': instance.name,
      'connections': instance.connections,
    };
