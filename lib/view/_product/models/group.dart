import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'package:mav_chat/view/_product/models/connection.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends INetworkModel<Group> {
  String name;
  List<Connection>? connections;

  Group({
    required this.name,
    this.connections,
  });

  @override
  Group fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
