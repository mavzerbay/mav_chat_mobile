import 'package:json_annotation/json_annotation.dart';

import 'package:mav_chat/core/base/model/abstracts/base_model.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends BaseModel<Message> {
  int? id;
  int? senderId;
  UserDto? sender;
  String? senderPhoto;
  int? receiverId;
  UserDto? receiver;
  String? receiverPhoto;
  String? messageText;
  DateTime? readDate;
  DateTime? sendDate;
  String? file;

  Message({
    this.id,
    this.senderId,
    this.sender,
    this.senderPhoto,
    this.receiverId,
    this.receiver,
    this.receiverPhoto,
    this.messageText,
    this.readDate,
    this.sendDate,
    this.file,
  });


  @override
  Message fromJson(Map<String, dynamic> json) {
    return _$MessageFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(this);
  }
}
