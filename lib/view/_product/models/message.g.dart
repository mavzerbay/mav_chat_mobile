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
    senderPhoto:
        (json['senderPhoto'] as List<dynamic>?)?.map((e) => e as int).toList(),
    receiverId: json['receiverId'] as int?,
    receiverUserName: json['receiverUserName'] as String?,
    receiverPhoto: (json['receiverPhoto'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    messageText: json['messageText'] as String?,
    readDate: json['readDate'] == null
        ? null
        : DateTime.parse(json['readDate'] as String),
    sendDate: json['sendDate'] == null
        ? null
        : DateTime.parse(json['sendDate'] as String),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderUserName': instance.senderUserName,
      'senderPhoto': instance.senderPhoto,
      'receiverId': instance.receiverId,
      'receiverUserName': instance.receiverUserName,
      'receiverPhoto': instance.receiverPhoto,
      'messageText': instance.messageText,
      'readDate': instance.readDate?.toIso8601String(),
      'sendDate': instance.sendDate?.toIso8601String(),
    };
