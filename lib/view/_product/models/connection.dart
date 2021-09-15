import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'connection.g.dart';

@JsonSerializable()
class Connection extends INetworkModel {
  String connectionId;
  String userName;

  Connection({
    required this.connectionId,
    required this.userName,
  });

  @override
  fromJson(Map<String, Object?> json) {
    return _$ConnectionFromJson(json);
  }

  factory Connection.fromJson(Map<String, Object> json) {
    return _$ConnectionFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$ConnectionToJson(this);
  }
}
