// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    connectionId: json['connectionId'] as String,
    userName: json['userName'] as String,
  );
}

Map<String, dynamic> _$ConnectionToJson(Connection instance) =>
    <String, dynamic>{
      'connectionId': instance.connectionId,
      'userName': instance.userName,
    };
