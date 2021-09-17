import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends INetworkModel {
  int id;
  int senderId;
  String senderUserName;
  List<int> senderPhoto;
  int receiverId;
  String receiverUserName;
  List<int> receiverPhoto;
  String messageText;
  DateTime? readDate;
  DateTime sendDate;

  Message({
    required this.id,
    required this.senderId,
    required this.senderUserName,
    required this.senderPhoto,
    required this.receiverId,
    required this.receiverUserName,
    required this.receiverPhoto,
    required this.messageText,
    this.readDate,
    required this.sendDate,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MessageFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(this);
  }
}
