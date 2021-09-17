import 'package:json_annotation/json_annotation.dart';
import 'package:mav_chat/core/base/model/abstracts/base_model.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends BaseModel<Message> {
  int? id;
  int? senderId;
  String? senderUserName;
  List<int>? senderPhoto;
  int? receiverId;
  String? receiverUserName;
  List<int>? receiverPhoto;
  String? messageText;
  DateTime? readDate;
  DateTime? sendDate;

  Message({
    this.id,
    this.senderId,
    this.senderUserName,
    this.senderPhoto,
    this.receiverId,
    this.receiverUserName,
    this.receiverPhoto,
    this.messageText,
    this.readDate,
    this.sendDate,
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
