// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int?,
    senderId: json['senderId'] as int?,
    senderUserName: json['senderUserName'] as String?,
    receiverId: json['receiverId'] as int?,
    receiverUserName: json['receiverUserName'] as String?,
    messageText: json['messageText'] as String?,
    readDate: json['readDate'] == null
        ? null
        : DateTime.parse(json['readDate'] as String),
    sendDate: json['sendDate'] == null
        ? null
        : DateTime.parse(json['sendDate'] as String),
    file: json['file'] as String?,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderUserName': instance.senderUserName,
      'receiverId': instance.receiverId,
      'receiverUserName': instance.receiverUserName,
      'messageText': instance.messageText,
      'readDate': instance.readDate?.toIso8601String(),
      'sendDate': instance.sendDate?.toIso8601String(),
      'file': instance.file,
    };
